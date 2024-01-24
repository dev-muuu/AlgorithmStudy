import functools

def comparator(a, b):
    if a[1] != b[1]:
        return 1 if a[1] > b[1] else -1
    else :
        return 1 if a[0] < b[0] else -1
    

def solution(genres, plays):
    
    genre = {}
    totalPlay = {}
    
    # 장르 재생 총합을 기준으로 정렬한다
    for i, (g,p) in enumerate(zip(genres, plays)):
        if g not in totalPlay:
            totalPlay[g] = 0
            genre[g] = []
        totalPlay[g] += p
        genre[g].append([i, p])
    
    # 장르 별로 가장 많이 재생된 노래 2개씩만 넣는다
    answer = []
    for g in sorted(totalPlay.items(), key=lambda x:x[1], reverse=True):
        candidate = sorted(genre[g[0]], key=functools.cmp_to_key(comparator), reverse=True)
        answer.append(candidate[0][0])
        if len(candidate) > 1:
            answer.append(candidate[1][0])
    
    return answer
