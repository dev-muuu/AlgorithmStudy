import sys
input = sys.stdin.readline

n = int(input())
rocks = list(map(int, input().split()))

dp = [1] * n

for i in range(n):
    temp = 0
    for j in range(i):
        if rocks[i] > rocks[j]:
            temp = max(temp, dp[j])
    dp[i] = temp+1

print(max(dp))
