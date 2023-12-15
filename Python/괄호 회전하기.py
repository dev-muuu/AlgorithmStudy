def solution(s):
    
    s = list(s)
    bracket = ["()","[]","{}"]
    result = 0
    
    for i in range(0, len(s)):
        
        stack = [s[i]]
        
        j = 0 if i+1 == len(s) else i+1
        
        while j != i:
            
            if len(stack) != 0 and (stack[-1]+s[j] in bracket):
                stack.pop()
            else:
                stack.append(s[j])
                
            j = 0 if j+1 == len(s) else j+1
            
        if len(stack) == 0:
            result += 1
    
    return result
