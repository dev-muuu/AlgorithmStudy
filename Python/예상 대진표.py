def solution(n,a,b):

    a -= 1
    b -= 1
    result = 0
    while a != b:
        a = int(a/2)
        b = int(b/2)
        result += 1
    
    return result
