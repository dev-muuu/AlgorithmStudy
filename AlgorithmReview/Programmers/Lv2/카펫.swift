//
//  카펫.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/24.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sum = (brown + 4) / 2
    for i in 1...sum/2{
        let j = sum - i
        if((i-2) * (j-2) == yellow){
            return [j, i]
        }
    }
    return []
}
