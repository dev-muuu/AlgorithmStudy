def solution(A, B):
    
    a = sorted(A, reverse=True)
    b = sorted(B, reverse=True)
    
    answer = 0
    bp = 0
    for i in a :
        if i < b[bp] :
            answer += 1
            bp += 1
    
    return answer
