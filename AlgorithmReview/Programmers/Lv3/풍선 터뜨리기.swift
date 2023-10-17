//
//  풍선 터뜨리기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/17.
//

import Foundation

func solution(_ a:[Int]) -> Int {
    
    var ans = 0
    var leftMin = [Int](repeating: 0, count: a.count)
    var rightMin = [Int](repeating: 0, count: a.count)
    
    leftMin[0] = a[0]
    for i in 1..<a.count {
        leftMin[i] = min(leftMin[i-1],a[i])
    }

    rightMin[a.count-1] = a[a.count-1]
    for i in stride(from: a.count-2, to: -1, by: -1) {
        rightMin[i] = min(rightMin[i+1],a[i])
    }
    
    for i in 0..<a.count {
        if leftMin[i] < a[i] && rightMin[i] < a[i] {
            ans += 1
        }
    }
    
    return a.count - ans
}
