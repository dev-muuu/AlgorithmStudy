def solution(queue1, queue2):
    
    # 총합이 홀수이면 -1을 반환한다.
    totalSum = sum(queue1) + sum(queue2)
    if totalSum % 2 != 0:
        return -1
    
    answer = 0
    p1 = 0
    p2 = len(queue1)
    queue = queue1 + queue2
    sum1 = sum(queue1)
    
    while p1 < p2 and p2 < len(queue):
    
        if sum1 < totalSum//2:
            sum1 += queue[p2]
            p2 += 1
        elif sum1 == totalSum//2:
            return answer
        else:
            sum1 -= queue[p1]
            p1 += 1
            
        answer += 1
    
    return -1
