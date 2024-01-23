def solution(bridge_length, weight, truck_weights):
    
    cross = []
    next = 0
    weightTotal = 0
    time = 0
        
    while True:
        
        time += 1
        
        # 트럭 제거
        if len(cross) > 0 and cross[0][1] + bridge_length == time:
            weightTotal -= truck_weights[cross[0][0]]
            del cross[0]
        
        # 트럭 추가
        if next < len(truck_weights) and weightTotal + truck_weights[next] <= weight:
            cross.append([next, time])
            weightTotal += truck_weights[next]
            next += 1
        
        if len(cross) == 0 :
            break
    
    
    return time
