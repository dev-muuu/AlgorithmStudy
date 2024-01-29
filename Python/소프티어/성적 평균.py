import sys

n, k = list(map(int, sys.stdin.readline().split()))
scores = list(map(int, sys.stdin.readline().split()))

sum = [0, scores[0]]
for i in range(1, len(scores)):
    sum.append(sum[-1] + scores[i])

for i in range(k):
    s, e = list(map(int, sys.stdin.readline().split()))
    
    # 1.
    print("{:.2f}".format((sum[e] - sum[s-1])/(e-s+1)))
    
#    if (sum[e] - sum[s-1])%(e-s+1) == 0:
#        print(str((sum[e] - sum[s-1])/(e-s+1)) + "0")
#    else:
#        print(round((sum[e] - sum[s-1])/(e-s+1), 2))
