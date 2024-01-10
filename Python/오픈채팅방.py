def solution(record):
    
    user = {}
    log = []
    
    for r in record:
        split = r.split(" ")
        if split[0] == "Enter":
            user[split[1]] = split[2]
            log.append([0, split[1]])
        elif split[0] == "Leave":
            log.append([1, split[1]])
        else:
            user[split[1]] = split[2]
    
    def mapNickname(data):
        explain = "들어왔습니다." if data[0] == 0 else "나갔습니다."
        return user[data[1]] + "님이 " + explain

    return list(map(mapNickname, log))
