def solution(clothes):
    
    map = {}
    for i in clothes:
        product, type = i[0], i[1]
        if type in map:
            map[type].append(product)
        else:
            map[type] = [product]
    
    result = 1
    for x in map.values():
        result *= len(x)+1
    
    return result - 1
