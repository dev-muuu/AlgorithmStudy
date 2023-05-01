//
//  n^2 배열 자르기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/01.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    
    let left = Int(left)
    let right = Int(right)

    var ans = [Int]()
    for i in left...right{
        let row = i / n
        let col = i % n
        ans.append(max(row, col) + 1)
    }
    return ans
}
