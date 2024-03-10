def solution(s, n):
    
    answer = ""
    
    for i in s:
        if i == " ":
            answer += i
        elif 97 <= ord(i) <= 122:
            new = (ord(i) - 97 + n) % 26
            answer += chr(97 + new)
        elif 65 <= ord(i) <= 90:
            new = (ord(i) - 65 + n) % 26
            answer += chr(65 + new)
    
    return answer
