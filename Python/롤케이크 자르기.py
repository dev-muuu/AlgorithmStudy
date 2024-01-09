def solution(topping):
    
    topping_a = {}
    topping_b = {}
    for i in topping:
        if i not in topping_b:
            topping_b[i] = 0
        topping_b[i] += 1
    
    answer = 0
    for i in topping:
        if i not in topping_a:
            topping_a[i] = 0
        topping_a[i] += 1
        
        if topping_b[i] == 1:
            del topping_b[i]
        else:
            topping_b[i] -= 1
            
        if len(topping_a) == len(topping_b):
            answer += 1
        
    return answer
