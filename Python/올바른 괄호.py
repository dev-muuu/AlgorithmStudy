def solution(s):
    
    stack = []
    for i in s:
        if i == "(" :
            stack.append(i)
        elif len(stack) != 0: # ')'인 경우
            pop = stack.pop()
            if pop == ")":
                return False
        else:
            return False
            
    return len(stack) == 0
