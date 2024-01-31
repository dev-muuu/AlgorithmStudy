import sys

n, m = list(map(int,input().split()))
w = list(map(int,sys.stdin.readline().split()))

best = [True] * n

for i in range(m):
    
    friend = list(map(int,sys.stdin.readline().split()))
    f1, f2 = list(map(lambda x:x-1, friend))

    if w[f1] >= w[f2] and best[f2]:
        best[f2] = False
    if w[f1] <= w[f2] and best[f1]:
        best[f1] = False

print(len(list(filter(lambda n:n, best))))
