def solution(want, number, discount):
    
    wantMap = {}
    for (i, w) in enumerate(want):
        wantMap[w] = number[i]
    
    for i in discount[0:10]:
        if i in want:
            wantMap[i] -= 1

    result = 0
    for i in range(10, len(discount)+10):
        
        if all(x <= 0 for x in wantMap.values()):
            result += 1
            
        if i < len(discount) and discount[i] in wantMap:
            wantMap[discount[i]] -= 1
        if discount[i-10] in wantMap:
            wantMap[discount[i-10]] += 1
        
    return result
