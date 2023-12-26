def solution(msg):

    map = {}
    for i in range(1,27):
        map[chr(65+i-1)] = i

    msg = list(msg)
    index = 0
    result = []
    
    while index < len(msg):
        # 현재 입력
        w = ""
        endIndex = index
        while endIndex < len(msg) and "".join(msg[index:endIndex+1]) in map:
            w = "".join(msg[index:endIndex+1])
            endIndex += 1
        wc = "".join(msg[index:endIndex+1])
        # 출력
        result.append(map[w])
        # 사전 추가
        map[wc] = len(map)+1
        
        index = endIndex
    
    return result
