//
//  최소직사각형.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/15.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var answer = (0, 0)
    for size in sizes {
        let width = max(size[0], size[1])
        let height = min(size[0], size[1])
        answer = ((max(width, answer.0)), max(height, answer.1))
    }
    return answer.0 * answer.1
}
