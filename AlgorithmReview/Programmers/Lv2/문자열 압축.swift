//
//  문자열 압축.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/31.
//

import Foundation

func solution1(_ s:String) -> Int {

    let s = Array(s).map{ String($0) }
    var ans = Int.max
    
    for length in stride(from: 1, to: max(2,s.count/2+1), by: +1) {
        
        var newS = s[0..<length].joined()
        var last = (newS, 1)
        var index = length
        
        while index < s.count{
            let current = s[index..<min(index+length, s.count)].joined()
            if current != last.0 {
                newS.write(current)
                last = (current, 1)
            } else {
                if [1,9,99,999].contains(last.1) {
                    newS.write("0")
                }
                last.1 += 1
            }
            index += length
        }
        ans = min(ans, newS.count)
    }
    return ans
}

func solution2(_ s:String) -> Int {

    let s = Array(s).map{ String($0) }
    var ans = Int.max
    
    for length in stride(from: 1, to: max(2,s.count/2+1), by: +1) {
        
        var newS = s[0..<length].joined()
        var last = (newS, 1)
        var index = length
        
        while index < s.count{
            let current = s[index..<min(index+length, s.count)].joined()
            if current == last.0 {
                last.1 += 1
            } else {
                if last.1 > 1 { newS.write("\(last.1)") }
                newS.write("\(current)")
                last = (current, 1)
            }
            index += length
        }
        if last.1 > 1 {
            newS.write("\(last.1)")
        }
        ans = min(ans, newS.count)
    }
    return ans
}
