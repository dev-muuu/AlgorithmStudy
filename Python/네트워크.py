def solution(n, computers):
    
    visit = [False] * n
    
    def network(k):
        for i in range(n):
            if computers[k][i] == True and visit[i] == False:
                visit[i] = True
                network(i)
    
    answer = 0
    for i in range(n):
        if visit[i] == False:
            visit[i] = True
            answer += 1
            network(i)
    
    return answer
