//
//  숫자 문자열과 영단어.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/18.
//

import Foundation

func solution(_ s:String) -> Int {
    
    let map = ["zero":0, "one":1, "two":2, "three":3, "four":4, "five":5, "six":6, "seven":7, "eight":8, "nine":9]
    let s = Array(s)
    
    var answer = ""
    var index = 0
    
    while index < s.count {
        
        if s[index].isNumber {
            answer += (String(s[index]))
            index += 1
            continue
        }
        
        var temp = String(s[index])
        index += 1
        while index < s.count && !s[index].isNumber{
            temp += String(s[index])
            index += 1
            if map[temp] != nil {
                break
            }
        }
        answer.write(String(map[temp]!))
    }
    
    return Int(answer)!
}

func reference(_ s:String) -> Int {
    let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var str = s
    for i in 0..<arr.count {
        str = str.replacingOccurrences(of: arr[i], with: String(i))
    }
    return Int(str)!
}
