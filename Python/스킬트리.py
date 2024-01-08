def solution(skill, skill_trees):
    
    skill = list(skill)
    skillElement = set(skill)
    
    answer = 0
    for target in skill_trees:
        
        target = list(target)
        
        sPoint = 0
        tPoint = 0
        
        isValid = True
        
        while sPoint < len(skill) and tPoint < len(target):
            
            if skill[sPoint] == target[tPoint]:
                sPoint += 1
                tPoint += 1
            elif target[tPoint] in skillElement:
                isValid = False
                break
            else:
                tPoint += 1
        
        if isValid :
            answer += 1
            
    return answer
