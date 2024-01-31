import sys

n = int(input())

dp = [0]*(n+1)
dp[0] = 2

for i in range(1, n+1):
    dp[i] = 2*dp[i-1]-1

print(dp[n]**2)
