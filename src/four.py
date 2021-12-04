#!/usr/bin/env python


def main():
  # get bingo draws
  draws = input()
  draws_lst = list(draws.split(','))

  # get bingo cards
  boards = []
  for i in range(100):
    a, b, c, d, e = [], [], [], [], []
    for j in range(6):
      board = input()
      if board: 
        bl = board.split()
        boards.append(set(bl))
        a.append(bl[0])
        b.append(bl[1])
        c.append(bl[2])
        d.append(bl[3])
        e.append(bl[4])
    boards.append(set(a))
    boards.append(set(b))
    boards.append(set(c))
    boards.append(set(d))
    boards.append(set(e))

  # start @ 5 here. Need at least 5 numbers for a win.
  i = 5
  total_draws = len(draws_lst)
  while i < total_draws:
    draw = draws_lst[:i]
    n = len(boards)
    j = 0
    while j < n:
      try:
        is_subset = boards[j].issubset(set(draw))
      except IndexError:
        break

      if is_subset:
        winner = boards[j]
        final_draw = draw
        final_board = []
        for k in range(j - (j % 10), j - (j % 10) + 10):
          final_board.append(boards[k].copy())

        for _ in range(10):
          boards.pop(j - (j % 10))

      else:
        j += 1
    i += 1

  out = set()
  for fb in final_board:
    out = out.union(fb)

  ans = int(final_draw[-1]) * sum([int(x) for x in out.difference(set(final_draw))])
  print(f"answer:  {ans}")


if __name__ == "__main__":
  main()
