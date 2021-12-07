#!/usr/bin/env python


def main():
  in_str = input()
  in_nums = list(map(int, in_str.split(',')))
  max_num = max(in_nums)

  min_so_far = 1000007
  for i in range(max_num):
    s = sum([abs(x - i) for x in in_nums])
    if s < min_so_far:
      min_so_far = s

  print(min_so_far)

  min_so_far = 100000007
  for i in range(max_num):
    s = sum([abs(x - i) * (abs(x - i) + 1) // 2 for x in in_nums])
    if s < min_so_far:
      min_so_far = s

  print(min_so_far)


if __name__ == "__main__":
  main()
