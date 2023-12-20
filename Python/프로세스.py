def solution(priorities, location):
    
    data = [(i,p) for (i,p) in enumerate(priorities)]
    priorities.sort()
    
    result = 0
    while len(data) != 0:
        
        pop = data.pop(0)
        
        if priorities[-1] == pop[1]:
            result += 1
            if pop[0] == location:
                break
            else:
                priorities.pop()
                continue
        else:
            data.append(pop)
                
    return result
