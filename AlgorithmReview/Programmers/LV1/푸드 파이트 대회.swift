//
//  푸드 파이트 대회.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/21.
//

import Foundation

func solution(_ food:[Int]) -> String {
    var answer = ""
    for i in 1..<food.count {
        answer += String(repeating: "\(i)", count: food[i]/2)
    }
    return answer + "0" + answer.reversed()
}
