def solution(order):
    
    n = max(order)
    p = 0
    container = []
    answer = 0

    for i in range(1,n+1):
        
        container.append(i)
        
        while p < len(order) and len(container) > 0 and order[p] == container[-1]:
            answer += 1
            p += 1
            container.pop()
    
    return answer
