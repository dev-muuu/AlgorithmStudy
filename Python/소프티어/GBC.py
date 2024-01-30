import sys

n, m = list(map(int,sys.stdin.readline().split()))

limit = [0] * 101
p = 0
for _ in range(n):
    d, r = list(map(int,sys.stdin.readline().split()))
    for j in range(p, p+d):
        limit[j] = r
    p += d

p = 0
answer = 0
for _ in range(m):
    d, r = list(map(int,sys.stdin.readline().split()))
    for j in range(p, p+d):
        if limit[j] < r:
            answer = max(answer, r-limit[j])
    p += d

print(answer)

