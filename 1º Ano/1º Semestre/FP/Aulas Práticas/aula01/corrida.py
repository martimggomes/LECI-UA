start_time = 6 * 60 + 52

walk_distance = 1
walk_pace = 10
walk_time = walk_distance * walk_pace

run_distance = 3
run_pace = 6
run_time = run_distance * run_pace

back_time = (walk_distance + run_distance) * 10

final_time = start_time + walk_time + run_time + back_time

mm = final_time // 60
ss = final_time % 60

print("Chegas às {}:{} para o pequeno-almoço.".format(mm, ss))

