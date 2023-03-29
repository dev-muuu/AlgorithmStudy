//
//  괄호 회전하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/29.
//

import Foundation

func solution(_ s:String) -> Int {

    let bracket = ["()", "[]", "{}"]
    let openBracket = bracket.map { $0.first! }

    func isCorrect(_ rotation: String) -> Bool{
        var stack = [Character]()
        for c in rotation{
            if(openBracket.contains(c)){
                stack.append(c); continue
            }
            let last = stack.last ?? " "
            if(bracket.contains("\(last)\(c)")){
                stack.removeLast()
            }else{
                return false
            }
        }
        return stack.isEmpty ? true : false
    }

    var string = Array(s)
    var ans = 0
    for i in 0..<s.count{
        let rotation = string[i..<s.count] + string[0..<i]
        if(isCorrect(String(rotation))){
            ans += 1
        }
    }
    return ans
}
