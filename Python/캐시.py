def solution(cacheSize, cities):
    
    answer = 0
    cache = {}
    
    if cacheSize == 0:
        return len(cities) * 5
    
    for i in range(0, len(cities)):
        data = cities[i].lower()
        if data in cache:
            answer += 1
        else:
            answer += 5
            if len(cache) == cacheSize:
                candidate = min(cache, key=cache.get)
                del cache[candidate]
                
        cache[data] = i
        
    return answer
