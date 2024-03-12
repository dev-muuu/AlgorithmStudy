//
//  두 개 뽑아서 더하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/18.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/68644

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer = Set<Int>()
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            answer.insert(numbers[i] + numbers[j])
        }
    }
    return answer.sorted(by:<)
}
