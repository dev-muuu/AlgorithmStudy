def solution(s):
    
    s = s.replace("{{","").replace("}}","")
    s = s.split("},{")
    
    arr = []
    for i in s:
        i = i.split(",")
        arr.append(i)
    
    arr.sort(key=len)
    
    answer = []
    already = set()
    for i in arr:
        for j in i:
            if j not in already:
                answer.append(int(j))
                already.add(j)
    
    return answer
