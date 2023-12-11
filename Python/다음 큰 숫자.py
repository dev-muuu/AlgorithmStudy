def solution(n):
    
    binary = list(format(n, 'b'))
    
    if '0' not in binary or binary[0] == "1":
        binary.insert(0, "0")

    swipe_idx = 0
    remain_one = -1
    for i in range(0, len(binary)):
        if i < len(binary)-1 and binary[i] == '0' and binary[i+1] == "1":
            swipe_idx = i
            remain_one = -1
        elif binary[i] == '1':
            remain_one += 1
    
    binary[swipe_idx] = '1'
    binary[swipe_idx+1] = '0'
    
    for i in range(len(binary)-1, swipe_idx+1, -1):
        if remain_one > 0:
            binary[i] = "1"
            remain_one -= 1
        else:
            binary[i] = "0"

    return int(''.join(binary), 2)
