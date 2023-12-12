def solution(brown, yellow):

    answer = []
    
    for x in range(1,2500):
        
        if yellow % x != 0:
            continue
            
        y = int(yellow/x)
        if x+y+2 == brown/2:
            answer = [x+2, y+2]
            break

    return sorted(answer, reverse=True)
