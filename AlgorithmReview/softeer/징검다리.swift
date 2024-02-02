//
//  징검다리.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2024/02/01.
//

import Foundation

let n = Int(readLine()!)!
let rocks = readLine()!.split(separator: " ")

var dp = [Int](repeating: 0, count: n)
for i in 0..<n {
    var temp = 0
    for j in 0..<i {
        if rocks[i] > rocks[j] {
            temp = max(temp, dp[j])
        }
    }
    dp[i] = temp+1
}

print(dp.max()!)
