//
//  덧칠하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2024/03/21.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    
    var answer = 1
    var pre = section.min()!
    
    for i in section {
        if i-pre >= m {
            answer += 1
            pre = i
        }
    }

    return answer
}
