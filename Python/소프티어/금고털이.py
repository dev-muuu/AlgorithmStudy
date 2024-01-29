import sys

w, n = list(map(int, sys.stdin.readline().split()))

gold = [list(map(int,sys.stdin.readline().split())) for _ in range(n)]
gold.sort(key=lambda x:x[1], reverse=True)

answer = 0
for (weight, value) in gold:
    if weight < w:
        w -= weight
        answer += weight*value
    else:
        answer += w*value
        break

print(answer)
