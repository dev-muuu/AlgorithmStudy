def solution(n, stations, w):
    
    answer = 0
    start = 1
    
    for s in stations:
        
        end = s-w-1
        answer += (end-start+1) // (2*w+1)
        
        if (end-start+1) % (2*w+1) != 0:
            answer += 1
            
        start = s+w+1
    
    if start <= n:
        
        answer += (n-start+1) // (2*w+1)
        
        if (n-start+1) % (2*w+1) != 0:
            answer += 1
    
    return answer
