import math

def solution(fees, records):
    
    car = {} #차량번호:[주차시간]
    
    def time(t):
        data = list(map(int, t.split(":")))
        return data[0]*60 + data[1]
    
    def calculate(t):
        if t <= fees[0]:
            return fees[1]
        return fees[1] + math.ceil((t-fees[0])/fees[2]) * fees[3]
    
    for record in records:
        
        data = record.split(" ")
        
        if data[1] not in car:
            car[data[1]] = []
            
        car[data[1]].append(time(data[0]))
        
    answer = []
    for c in sorted(car):
        
        if len(car[c]) % 2 != 0:
            car[c].append(time("23:59"))
            
        total = 0
        for i in range(0, len(car[c]), +2):
            total += car[c][i+1] - car[c][i]
            
        answer.append(calculate(total))
        
    return answer
