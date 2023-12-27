//
//  n진수 게임.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/12.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {

    var input = [Character]()
    var number = 0
    while input.count < t*m+1 {
        let numStr = Array(String(number, radix: n).uppercased())
        input.append(contentsOf: numStr)
        number += 1
    }
    
    var result = ""
    for i in stride(from: p-1, to: m*t, by: +m) {
        result.append(input[i])
    }
    
    return result
}
