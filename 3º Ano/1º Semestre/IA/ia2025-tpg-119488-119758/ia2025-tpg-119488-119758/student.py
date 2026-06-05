# Trabalho Realizado por:
# Fernando Ferreira - 119758
# Martim Gomes - 119488

import asyncio
import getpass
import json
import os
import random
import websockets

# vars globais usadas para nao deixar que de para subir e descer logo em frames consecutivos
RECENT_CLIMB_FRAMES = 0
RECENT_DESCEND_FRAMES = 0


# largura e altura do mapa
def _map_size(mapa):
    if not mapa:
        return 40, 24
    return len(mapa[0]), len(mapa)


# funcao para ver se uma celula qq tem cogumelo
def _is_mushroom(mapa, x, y):
    try:
        if y < 0 or x < 0:
            return False
        return mapa[y][x] == 2
    except Exception:
        return False


# funcao que recebe o estado atual do agente e vai devolver o que ele ira fazer
def decidir_acao(state):
    global RECENT_CLIMB_FRAMES, RECENT_DESCEND_FRAMES

    # atualizacao dos contadores de cooldown para subida e descida
    if RECENT_CLIMB_FRAMES > 0:
        RECENT_CLIMB_FRAMES -= 1
    if RECENT_DESCEND_FRAMES > 0:
        RECENT_DESCEND_FRAMES -= 1

    bug = state.get("bug_blaster") or {}
    if not bug or "pos" not in bug or not bug.get("alive", True):
        return "A"

    mapa = state.get("map", [])
    centipedes = state.get("centipedes", [])
    mushrooms = state.get("mushrooms", [])
    mushroom_cells = {tuple(m["pos"]) for m in mushrooms}
    spider = state.get("spider")
    flee = state.get("flee")

    W, H = _map_size(mapa)
    BASE = H - 1
    L1 = BASE - 1  # segunda linha
    L2 = BASE - 2  # terceira linha

    SAFE_LEFT = 2
    SAFE_RIGHT = W - 3

    x, y = bug["pos"]

    dangerous_cells = set()  # todas as posições q sao atualmente perigosas
    future_threats = set()  # previsoes de perigo no prox frame

    segments = [(sx, sy) for c in centipedes for (sx, sy) in c.get("body", [])]
    for seg in segments:
        dangerous_cells.add(seg)

    for sx, sy in segments:
        future_threats.add((sx + 1, sy))  # direita
        future_threats.add((sx - 1, sy))  # esquerda
        future_threats.add((sx, sy + 1))  # descer

        # 2 passoa a frente para n acontecer colisao frontal
        future_threats.add((sx + 2, sy))
        future_threats.add((sx - 2, sy))

    if spider and spider.get("alive"):
        sx, sy = spider["pos"]
        dangerous_cells.add((sx, sy))
        for dx in [-1, 0, 1]:
            for dy in [-1, 0, 1]:
                dangerous_cells.add((sx + dx, sy + dy))
                future_threats.add((sx + dx, sy + dy))

    if flee and flee.get("alive"):
        fx, fy = flee["pos"]
        dangerous_cells.add((fx, fy))
        dangerous_cells.add((fx, fy + 1))
        dangerous_cells.add((fx, fy + 2))
        future_threats.add((fx, fy + 1))
        future_threats.add((fx, fy + 2))

    # Funcoes auxiliares
    # verifica se uma cel esta livre(tem de esta dentro do mapa, sem cogumelos e sem inimigos)
    def cell_free(nx, ny):
        if nx < 0 or nx >= W or ny < 0 or ny >= H:
            return False
        if (nx, ny) in mushroom_cells or _is_mushroom(mapa, nx, ny):
            return False
        if (nx, ny) in dangerous_cells:
            return False
        return True

    # ve se uma cel mesmo que esteja livre agr nao ficara ocupada no proximo frame
    def will_be_safe(nx, ny, future_threats):
        if nx < 0 or nx >= W or ny < 0 or ny >= H:
            return False
        if (nx, ny) in dangerous_cells:
            return False
        return (nx, ny) not in future_threats

    # ve se o movimento lateral esta bloqueado por cogumelos
    # se tiver pode ser dps usados movimentos verticais para fugir
    def lateral_blocked_by_mushroom():
        return (
            ((x - 1, y) in mushroom_cells)
            or ((x + 1, y) in mushroom_cells)
            or _is_mushroom(mapa, x - 1, y)
            or _is_mushroom(mapa, x + 1, y)
        )

    # ve se o agente esta encurralado(nao consegue ir para baixo ou para o lado)
    # criada mais especificamente para subir a L3 quando acontece isto no L2
    def trapped_here(y):
        down_blocked = not cell_free(x, y + 1)
        left_blocked = not cell_free(x - 1, y)
        right_blocked = not cell_free(x + 1, y)
        return down_blocked and left_blocked and right_blocked

    # perigo forte na linha atual onde o agente esta
    def lateral_danger_strong():
        for check_x in range(x - 3, x + 4):
            if (check_x, y) in dangerous_cells:
                return True
        return False

    # ve se e seguro descer para baixo, se L1 e L2 nao tiverem ameacas nenhumas
    def low_zone_clear():
        for dx, dy in dangerous_cells:
            if dy == L1 or dy == L2:
                return False
        return True

    # para verificar se e seguro ficar na base
    def base_safe(col_x):
        for dx, dy in dangerous_cells:
            if dy == BASE and abs(dx - col_x) <= 4:
                return False
        return True

    # func para fazer um movimento lateral respeitandos os limites do mapa
    # se esquerda e direita derem os 2 escolhe de forma aleatoria(random.choice(["a", "d"]))
    def move_safe_lateral():
        if x <= SAFE_LEFT:
            return "d"
        if x >= SAFE_RIGHT:
            return "a"
        can_go_left = cell_free(x - 1, y)
        can_go_right = cell_free(x + 1, y)
        if can_go_left and can_go_right:
            return random.choice(["a", "d"])
        elif can_go_left:
            return "a"
        elif can_go_right:
            return "d"
        return ""

    # nao deixa que suba quando ha forte probabilidade de colidir com segmentos da centopeia
    def is_suicide_to_climb():
        for sx, sy in segments:
            # os segmentos da centopeia que podem colidir estao ou imediatamente acima ou estao para cair
            if sy == y - 1 and abs(sx - x) <= 2:
                return True
            if sy == y - 2 and abs(sx - x) <= 1:
                return True
        return False

    # verifica qual dos lados tem menos ameacas
    def get_safest_lateral_move(can_left, can_right):
        if not can_left and not can_right:
            return None
        if can_left and not can_right:
            return "a"
        if can_right and not can_left:
            return "d"

        left_penalty = 0
        right_penalty = 0

        for sx, sy in segments:

            if sy == y:  # na mesma linha
                dist = sx - x
                if -6 < dist < 0:
                    left_penalty += 10 - abs(dist)
                if 0 < dist < 6:
                    right_penalty += 10 - abs(dist)

            # linha acima
            if sy == y - 1 and abs(sx - x) <= 2:
                if sx < x:
                    left_penalty += 5
                else:
                    right_penalty += 5

        if left_penalty > right_penalty:
            return "d"
        if right_penalty > left_penalty:
            return "a"

        # se for igual vai ser aleatorio
        return random.choice(["a", "d"])

    # func para casos critivos, movimentos laterais sao priorizados
    def escape_lateral_or_vertical():
        global RECENT_CLIMB_FRAMES, RECENT_DESCEND_FRAMES

        if lateral_blocked_by_mushroom():
            # so da para subir se nao tivermos descido recentemente
            # isto evita que desca logo no frame a seguir a ter subido
            if RECENT_DESCEND_FRAMES == 0:
                if (
                    cell_free(x, y - 1)
                    and will_be_safe(x, y - 1, future_threats)
                    and not is_suicide_to_climb()
                ):
                    RECENT_CLIMB_FRAMES = 3
                    return "w"

            # so da para descer se nao tivermos subido recentemente
            # isto evita que suba logo no frame a seguir a ter descido
            if RECENT_CLIMB_FRAMES == 0:
                if cell_free(x, y + 1) and will_be_safe(x, y + 1, future_threats):
                    RECENT_DESCEND_FRAMES = 3
                    return "s"

        move = move_safe_lateral()
        if move:
            return move

        if (
            cell_free(x, y - 1)
            and will_be_safe(x, y - 1, future_threats)
            and not is_suicide_to_climb()
        ):
            RECENT_CLIMB_FRAMES = 2
            return "w"

        if cell_free(x, y + 1) and will_be_safe(x, y + 1, future_threats):
            RECENT_DESCEND_FRAMES = 2
            return "s"

        return ""

    # ve se para onde o tiro vai verticalmente nao estao centopeias em posicoes que podem ser peigosas, se por ex, elas cairem depois
    def shot_blocked():
        shot_col = x
        for sx, sy in segments:
            if sx == shot_col and sy == y - 1:
                return True
            if sx == shot_col and sy in (y - 2, y - 3):
                return True
            if abs(sx - shot_col) == 1 and sy == y - 2:
                return True
        return False

    # para ver se a coluna de tiro esta livre e da para disparar com perfeitas condiçoes sem ter perigo imediato ou futuro
    def column_clear_for_shot(col_x, from_y, to_y):
        y_top = min(from_y, to_y)
        y_bottom = max(from_y, to_y)
        for yy in range(y_top + 1, y_bottom):
            if _is_mushroom(mapa, col_x, yy):
                return False
            if (col_x, yy) in dangerous_cells:
                return False
        return True

    # logica de disparo, decide quando e onde disparar com base na pont atual e no estado do jogo
    def best_shot_key():
        current_score = state.get("score", 0)

        # estrategia inicial(focar nas flees ate atingir 2000 pts dps pode tbm acertar na centopeia normalmente)
        if current_score < 2000:
            if flee and flee.get("alive"):
                fx, fy = flee["pos"]
                if x == fx:
                    if (y - fy) % 2 != 0:
                        return ""
                    if not shot_blocked() and column_clear_for_shot(x, y, fy):
                        return "A"
                if x < fx and cell_free(x + 1, y):
                    return "d"
                if x > fx and cell_free(x - 1, y):
                    return "a"
            return move_safe_lateral()

        # estrategia normal prioriza tambem as pulgas mas tbm pode acertar nas centopeias enquanto as pulgas nao estao a cair
        if not segments:
            return "A"
        if any(sy >= L1 for (_, sy) in segments):
            return move_safe_lateral()
        if not low_zone_clear():
            return move_safe_lateral()

        MIN_TARGET_DY = 4
        aligned_targets = []
        for sx, sy in segments:
            if sx == x and sy <= y - MIN_TARGET_DY:
                if column_clear_for_shot(x, y, sy):
                    aligned_targets.append((sx, sy))

        if aligned_targets:
            if shot_blocked():
                return move_safe_lateral()
            return "A"

        candidate_targets = [
            (sx, sy)
            for (sx, sy) in segments
            if sy <= y - MIN_TARGET_DY and column_clear_for_shot(sx, y, sy)
        ]
        if not candidate_targets:
            return move_safe_lateral()

        # cogumelos numa dada coluna
        def mushrooms_in_column(col_x, from_y, to_y):
            y_top = min(from_y, to_y)
            y_bottom = max(from_y, to_y)
            count = 0
            for yy in range(y_top + 1, y_bottom):
                if _is_mushroom(mapa, col_x, yy):
                    count += 1
            return count

        best_score = float("inf")
        best_target = None
        for sx, sy in candidate_targets:
            dx = abs(sx - x)
            dy = y - sy
            mush = mushrooms_in_column(sx, y, sy)
            score = dx * 5 + dy * 1 + mush * 8
            if score < best_score:
                best_score = score
                best_target = (sx, sy)

        if best_target is None:
            return move_safe_lateral()
        target_sx, target_sy = best_target
        if target_sx < x and cell_free(x - 1, y):
            return "a"
        if target_sx > x and cell_free(x + 1, y):
            return "d"
        return move_safe_lateral()

    # PULGA
    if flee and flee.get("alive") and y < BASE:
        fx, fy = flee["pos"]

        # se a pulga estiver perigosamente perto
        if abs(x - fx) <= 1 and fy < y:

            # verifica se pode ir para esq ou direita
            can_go_left = cell_free(x - 1, y) and will_be_safe(x - 1, y, future_threats)
            can_go_right = cell_free(x + 1, y) and will_be_safe(
                x + 1, y, future_threats
            )

            danger_below = False
            for sx, sy in segments:
                if sy == y + 1 and abs(sx - x) <= 2:
                    danger_below = True
                    break
                if sy == y and abs(sx - x) <= 1:
                    danger_below = True
                    break

            can_go_down = (
                not danger_below
                and cell_free(x, y + 1)
                and will_be_safe(x, y + 1, future_threats)
            )

            # se a pulga estiver exatamente na nossa coluna
            if x == fx:
                # descer se for seguro é o que tem prioridade
                if can_go_down:
                    RECENT_DESCEND_FRAMES = 2
                    return "s"

                # se nao der para descer avalia para qual lado e melhor ir
                best_lateral = get_safest_lateral_move(can_go_left, can_go_right)
                if best_lateral:
                    return best_lateral

            # Se esta na col ao lado
            else:
                # aqui tem prioridade afastar primeiro lateralmente
                if x < fx:
                    if can_go_left:
                        return "a"
                    elif can_go_down:
                        RECENT_DESCEND_FRAMES = 2
                        return "s"
                    elif can_go_right:
                        pass

                elif x > fx:
                    if can_go_right:
                        return "d"
                    elif can_go_down:
                        RECENT_DESCEND_FRAMES = 2
                        return "s"
                    elif can_go_left:
                        pass

            # em ultimo caso vai subir de forma ja um pouco em desespero para tentar fugir
            if (
                cell_free(x, y - 1)
                and will_be_safe(x, y - 1, future_threats)
                and not is_suicide_to_climb()
            ):
                RECENT_CLIMB_FRAMES = 2
                return "w"

            if not shot_blocked():
                return "A"

    # Perigo lateral na linha atual
    peril = lateral_danger_strong()

    if peril:
        #ve os perigos a esquerda e a direita
        left_threat = False
        right_threat = False
        for i in range(1, 4):
            if (x - i, y) in dangerous_cells:
                left_threat = True
            if (x + i, y) in dangerous_cells:
                right_threat = True

        if y == BASE:
            #fuga da aranha quando ela desce ate a base
            if spider and spider.get("alive"):
                sx, sy = spider["pos"]
                if abs(sx - x) <= 3 and abs(sy - y) <= 1:
                    move = move_safe_lateral()
                    if move:
                        return move
                    #se nao der para fugir lateralmente tenta subir
                    if cell_free(x, L1) and not is_suicide_to_climb():
                        RECENT_CLIMB_FRAMES = 2
                        return "w"

            #perigo dos 2 lados logo vai tentar subir
            if left_threat and right_threat:
                if cell_free(x, L1) and not is_suicide_to_climb():
                    RECENT_CLIMB_FRAMES = 2
                    return "w"
                return move_safe_lateral()
            #se so for de um lado tenta fugiur para o lado oposto
            if left_threat and cell_free(x + 1, y):
                return "d"
            if right_threat and cell_free(x - 1, y):
                return "a"
            if cell_free(x, L1) and not is_suicide_to_climb():
                RECENT_CLIMB_FRAMES = 2
                return "w"
            return escape_lateral_or_vertical()

        if y == L1:
            #se houver uma centopeia acima ele tenta descer para a base se der
            for sx, sy in segments:
                if sx == x and sy == L2:
                    if cell_free(x, BASE):
                        RECENT_DESCEND_FRAMES = 2
                        return "s"
                    else:
                        return move_safe_lateral()
            #se houver perigo lateral, ver se e melhor subir ou descer
            if left_threat or right_threat:
                can_go_up_now = cell_free(x, L2)
                can_go_up_future = (
                    will_be_safe(x, L2, future_threats) and not is_suicide_to_climb()
                )
                can_go_down_now = cell_free(x, BASE)
                can_go_down_future = will_be_safe(x, BASE, future_threats)
                #subir se der
                if can_go_up_now and can_go_up_future:
                    RECENT_CLIMB_FRAMES = 2
                    return "w"
                #descer se der
                if can_go_down_now and can_go_down_future:
                    RECENT_DESCEND_FRAMES = 2
                    return "s"
                if can_go_up_now and not can_go_down_now and not is_suicide_to_climb():
                    RECENT_CLIMB_FRAMES = 2
                    return "w"
                if can_go_down_now and not can_go_up_now:
                    RECENT_DESCEND_FRAMES = 2
                    return "s"
                #se nem subir nem descer for seguro tenta mover lateralmente
                return move_safe_lateral()

            #tenta voltar para a base se for seguro e nao houver ameaça lateral
            if (
                cell_free(x, BASE)
                and will_be_safe(x, BASE, future_threats)
                and RECENT_CLIMB_FRAMES == 0
            ):
                RECENT_DESCEND_FRAMES = 2
                return "s"
            return move_safe_lateral()

        if y == L2:
            #perigo logo abaixo(L1)
            danger_below = False
            for sx, sy in segments:
                if sx == x and sy == L1:
                    danger_below = True
                    break
            #se estiver encurralado(perigo a baixo e bloequeado lateralmente) tenta subir para o L3
            if (
                danger_below
                and (left_threat or not cell_free(x - 1, y))
                and (right_threat or not cell_free(x + 1, y))
            ):
                if cell_free(x, y - 1) and not is_suicide_to_climb():
                    RECENT_CLIMB_FRAMES = 2
                    return "w"
            #se tiver dos dois lados mas em baixo for seguro descee para L1
            if left_threat and right_threat:
                if cell_free(x, L1):
                    RECENT_DESCEND_FRAMES = 2
                    return "s"
                else:
                    return move_safe_lateral()
            #se for so ameaça de um lado, tenta fugir lateralmente
            if left_threat and cell_free(x + 1, y):
                return "d"
            if right_threat and cell_free(x - 1, y):
                return "a"
            #se n tiver ameaça lateral desce
            if cell_free(x, L1):
                RECENT_DESCEND_FRAMES = 2
                return "s"
            return move_safe_lateral()

    #Comportamento para a pulga
    if flee and flee.get("alive"):
        fx, fy = flee["pos"]
        dist_y = y - fy

        # Se a pulga tiver suficientemente longe tenta mata-la
        if dist_y > 2:
            #se estiver alinhado
            if x == fx - 1 or x == fx + 1:
                shot_col = fx
                for sx, sy in segments:
                    if sx == shot_col and (y - 2) <= sy < y:
                        return move_safe_lateral()
                for sx, sy in segments:
                    if abs(sx - shot_col) <= 1 and (sy == y - 2 or sy == y - 1):
                        return move_safe_lateral()

                if not will_be_safe(x, y, future_threats):
                    return move_safe_lateral()
                if shot_blocked():
                    return move_safe_lateral()
                return "A"
            #se nao estiver alinhado tenta alinhar
            if x < fx and cell_free(x + 1, y):
                return "d"
            if x > fx and cell_free(x - 1, y):
                return "a"

        #Pulga esta demasiado perto, nao dispara aqui
        elif dist_y > 0 and abs(x - fx) <= 1:
            return move_safe_lateral()

    #Jogo normal, quando nao ha perigo no imediato
    if y < L2:
        #se tiver encurralado vai tentar subir
        if trapped_here(y):
            if (
                cell_free(x, y - 1)
                and will_be_safe(x, y - 1, future_threats)
                and not is_suicide_to_climb()
            ):
                RECENT_CLIMB_FRAMES = 2
                return "w"
        #isto é para nao descer logo no frame a seguir a subir
        if RECENT_CLIMB_FRAMES > 0:
            return move_safe_lateral()

        nx_down = x
        ny_down = y + 1
        #descida feita normalmente quando nao ha perigo lateral
        if cell_free(nx_down, ny_down) and will_be_safe(
            nx_down, ny_down, future_threats
        ):
            threat_left_down = (x - 1, ny_down) in dangerous_cells
            threat_right_down = (x + 1, ny_down) in dangerous_cells
            if not threat_left_down and not threat_right_down:
                return "s"

        return escape_lateral_or_vertical()

    if y == L2 and low_zone_clear() and cell_free(x, L1):
        return "s"
    if (
        y == L1
        and low_zone_clear()
        and base_safe(x)
        and cell_free(x, BASE)
        and RECENT_CLIMB_FRAMES == 0
    ):
        return "s"
    #na base so dispara quando e seguro
    if y == BASE:
        if not low_zone_clear():
            return move_safe_lateral()
        if not base_safe(x):
            return move_safe_lateral()
        return best_shot_key()

    return best_shot_key()


async def agent_loop(server_address="localhost:8000", agent_name="student"):
    async with websockets.connect(f"ws://{server_address}/player") as websocket:
        await websocket.send(json.dumps({"cmd": "join", "name": agent_name}))
        while True:
            try:
                state = json.loads(await websocket.recv())
                key = decidir_acao(state)
                print("Score:", state.get("score"))
                await websocket.send(json.dumps({"cmd": "key", "key": key}))
            except (
                websockets.exceptions.ConnectionClosedOK,
                websockets.exceptions.ConnectionClosedError,
            ):
                return

# DO NOT CHANGE THE LINES BELLOW
# You can change the default values using the command line, example:
# $ NAME='arrumador' python3 client.py
loop = asyncio.get_event_loop()
SERVER = os.environ.get("SERVER", "localhost")
PORT = os.environ.get("PORT", "8000")
NAME = os.environ.get("NAME", getpass.getuser())
loop.run_until_complete(agent_loop(f"{SERVER}:{PORT}", NAME))