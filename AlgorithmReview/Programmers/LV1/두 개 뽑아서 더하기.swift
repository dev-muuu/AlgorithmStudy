//
//  두 개 뽑아서 더하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/18.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/68644

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = Set<Int>()
    for i in 0..<numbers.count{
        for j in i+1..<numbers.count{
            result.insert(numbers[i] + numbers[j])
        }
    }
    return result.sorted{ $0 < $1 }
}
