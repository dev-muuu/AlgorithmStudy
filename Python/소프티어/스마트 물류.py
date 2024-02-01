import sys

n, k = list(map(int,sys.stdin.readline().split()))
data = list(sys.stdin.readline().rstrip())

answer = 0
for i in range(0,len(data)):
    if data[i] == 'P':
        for j in range(i-k,i+k+1):
            if j<0 or j>=n:
                continue
            elif data[j] == 'H':
                answer += 1
                data[j] = '-'
                break

print(answer)
