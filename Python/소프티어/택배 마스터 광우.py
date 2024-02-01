import sys
import itertools

n, m, k = list(map(int, sys.stdin.readline().split()))
w = list(map(int, sys.stdin.readline().split()))

answer = 2**128
for permutation in list(itertools.permutations(w, n)):
    p = 0
    temp = 0
    for i in range(k):
        tempW = 0
        while tempW + permutation[p] <= m:
            tempW += permutation[p]
            p = 0 if p == n-1 else p+1
        temp += tempW
    answer = min(answer, temp)
    
print(answer)
