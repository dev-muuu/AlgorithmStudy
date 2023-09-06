//
//  n^2 배열 자르기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/01.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var ans = [Int]()
    for i in Int(left)...Int(right) {
        let (row, col) = (i/n+1, i%n+1)
        ans.append(max(row, col))
    }
    return ans
}
