def solution(k, tangerine):
    
    map = { }
    for t in tangerine:
        if t in map:
            map[t] += 1
        else:
            map[t] = 1
    
    sort = sorted(map.items(), key = lambda x: x[1], reverse=True)

    size = set()
    count = 0
    for (id, cnt) in sort:
        size.add(id)
        count += cnt
        if count >= k:
            break
    
    return len(size)
