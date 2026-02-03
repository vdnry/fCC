def hanoi_solver(n):
    one = [i for i in range(n, 0, -1)]
    two = []
    three = []
    tower = {1: one, 2: two, 3: three}
    moves = f'{one} {two} {three}'

    def hanoi(i, start_index, end_index):
        if i < 1:
            return
        start = tower[start_index]
        end = tower[end_index]
        other_index = 6 - (start_index + end_index)
        if start[-1] != i:
            hanoi(i-1, start_index, other_index)
        nonlocal moves
        moves += '\n'
        end.append(start.pop())
        moves += f'{one} {two} {three}'
        hanoi(i-1, other_index, end_index)

    hanoi(n, 1, 3)
    return moves

print(hanoi_solver(8))