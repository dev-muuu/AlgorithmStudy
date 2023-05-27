//
//  롤케이크 자르기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/27.
//

import Foundation

func solution(_ topping:[Int]) -> Int {

    var toppingCount = [Int](repeating: 0, count: 10001)
    for i in topping{
        toppingCount[i] += 1
    }
    
    var bigSet = Set<Int>(), smallSet = Set<Int>(topping)
    var ans = 0
    for i in topping{
        bigSet.insert(i)
        toppingCount[i] -= 1
        if toppingCount[i] == 0 {
            smallSet.remove(i)
        }
        if bigSet.count == smallSet.count {
            ans += 1
        }
    }
    return ans
}
