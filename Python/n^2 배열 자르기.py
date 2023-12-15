def solution(n, left, right):
    
    result = [0] * (right-left+1)
    
    for i in range(left, right+1):
        result[abs(left-i)] = max(i//n, i%n)+1
        
    return result
