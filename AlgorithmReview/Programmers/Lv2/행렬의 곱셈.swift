//
//  행렬의 곱셈.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/04/10.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    for i in arr1{
        var row = [Int]()
        for k in 0..<arr2[0].count{
            var sum = 0
            for j in 0..<arr2.count{
                sum += i[j] * arr2[j][k]
            }
            row.append(sum)
        }
        result.append(row)
    }
    return result
}
