def solution(n, words):

    speak = set()
    for (i, w) in enumerate(words):
        if w in speak or (i > 0 and words[i-1][-1] != w[0]):
            return [int(i%n)+1, int(i/n)+1]
        speak.add(w)
    
    return [0,0]
