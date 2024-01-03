//
//  뒤에 있는 큰 수 찾기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/23.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var ans = [-1]
    var stack = [numbers.last!]
    for i in stride(from: numbers.count-2, to: -1, by: -1) {
        
        while !stack.isEmpty && stack.last! <= numbers[i] {
            stack.removeLast()
        }
        
        if stack.isEmpty {
            ans.append(-1)
        }
        else {
            ans.append(stack.last!)
        }
        
        stack.append(numbers[i])
    }
    
    return ans.reversed()
}
