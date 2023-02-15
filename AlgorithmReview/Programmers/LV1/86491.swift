//
//  86491.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/15.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var maxWidth = 0
    var maxHeight = 0
    for i in 0..<sizes.count{
        if(sizes[i][0] > sizes[i][1]){
            maxWidth = max(maxWidth, sizes[i][1])
            maxHeight = max(maxHeight, sizes[i][0])
            continue
        }
        maxWidth = max(maxWidth, sizes[i][0])
        maxHeight = max(maxHeight, sizes[i][1])
    }
    return maxWidth * maxHeight
}
