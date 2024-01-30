import sys

n = int(input())
data = [list(map(int,sys.stdin.readline().rstrip())) for _ in range(n)]
visit = [[False] * n for _ in range(n)]
count = 0

def search(i, j):

    global count
    
    for coord in [[0,1],[1,0],[0,-1],[-1,0]]:
    
        row, col = i+coord[0], j+coord[1]
        
        if 0<=row<n and 0<=col<n and data[row][col] == 1 and visit[row][col] == False:
            visit[row][col] = True
            count += 1
            search(row,col)

answer = []
for i in range(n):
    for j in range(n):
        if data[i][j] == 1 and visit[i][j] == False:
            count = 1
            visit[i][j] = True
            search(i, j)
            answer.append(count)

print(len(answer))
for i in sorted(answer):
    print(i)
