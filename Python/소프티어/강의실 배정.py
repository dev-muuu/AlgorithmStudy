import sys

n = int(input())

lect = [list(map(int,sys.stdin.readline().split())) for _ in range(n)]
lect.sort(key=lambda x: (x[1], x[0]))

answer = 0
end = 0
for s,e in lect:
    if end <= s:
        answer += 1
        end = e

print(answer)
