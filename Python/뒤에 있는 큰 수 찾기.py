def solution(numbers):
    
    answer = [-1] * len(numbers)
    stack = [numbers[-1]]
    
    for i in range(len(numbers)-2, -1, -1):
        
        while len(stack) > 0 and stack[-1] <= numbers[i]:
            del stack[-1]
        
        if len(stack) != 0:
            answer[i] = stack[-1]
        
        stack.append(numbers[i])
    
    return answer
