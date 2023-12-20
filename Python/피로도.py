def solution(k, dungeons):
    
    orders = []
    visit = [False] * len(dungeons)
    
    def generate(d):
        
        if len(d) == len(dungeons):
            orders.append(d)
            return
        
        for i in range(0, len(dungeons)):
            if visit[i] == False:
                visit[i] = True
                generate(d + [i])
                visit[i] = False
            
    generate([])
    
    answer = 0
    for order in orders:
        remain = k
        complete = 0
        for i,stage in enumerate(order):
            if remain >= dungeons[stage][0]:
                remain -= dungeons[stage][1]
                complete += 1
            else:
                break
        answer = max(answer, complete)
                
    return answer
