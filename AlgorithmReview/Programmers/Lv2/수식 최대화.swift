//
//  수식 최대화.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/14.
//

import Foundation

func solution(_ expression:String) -> Int {
    
    let nums = expression
                    .replacingOccurrences(of: "+", with: " ")
                    .replacingOccurrences(of: "-", with: " ")
                    .replacingOccurrences(of: "*", with: " ")
                    .split(separator: " ")
                    .map{ Int($0)! }
    
    let operands = Array(expression.filter{ !$0.isNumber })
    let op = Array(Set(operands))
    
    var ans = 0
    var contain = [Bool](repeating: false, count: op.count)
    
    func calculate(_ po: [Character]){
        
        var nums = nums
        var operands = operands
        
        for p in po {
            var i = 0
            while i < operands.count {
                let op = operands[i]
                if op == p {
                    let temp: Int
                    switch op {
                        case "+":   temp = nums[i] + nums[i+1]
                        case "*":   temp = nums[i] * nums[i+1]
                        case "-":   temp = nums[i] - nums[i+1]
                        default:    continue
                    }
                    var slice = Array(nums[0..<i]) + [temp]
                    if i+2 < nums.count {
                        slice += Array(nums[i+2..<nums.count])
                    }
                    nums = slice
                    operands.remove(at: i)
                } else {
                    i += 1
                }
            }
        }
        ans = max(abs(nums.first!), ans)
    }
    
    
    func priority(_ array: [Character]){
        if array.count == op.count {
            calculate(array); return
        }
        
        for i in stride(from: 0, to: op.count, by: +1) {
            if contain[i] { continue }
            contain[i] = true
            priority(array + [op[i]])
            contain[i] = false
        }
    }
    
    priority([])
    
    return ans
}
