//
//  뒤에 있는 큰 수 찾기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var ans = [Int](repeating: -1, count: numbers.count)
    var index = numbers.count - 1
    var stack = [numbers.last!]
    while index >= 0 {
        while !stack.isEmpty {
            let last = stack.last!
            if last > numbers[index] {
                ans[index] = last; break
            } else {
                stack.removeLast()
            }
        }
        stack.append(numbers[index])
        index -= 1
    }
    return ans
}
