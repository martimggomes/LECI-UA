import bisect

with open("C:\\Users\\MARTIM\\Desktop\\Disciplinas\\FP_EE\\aula09\\wordlist.txt", "r") as f:
    word_list: list[str] = f.read().split()

    begin_index: int = bisect.bisect_left(word_list, "ea")
    end_index: int = bisect.bisect_left(word_list, "eb")

    print(f"Words started with 'ea': {end_index - begin_index}")