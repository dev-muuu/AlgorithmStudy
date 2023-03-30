//
//  귤 고르기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/30.
//

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var count = [Int: Int]()
    for i in tangerine{
        if(count[i] == nil){
            count[i] = 0
        }
        count[i]! += 1
    }
    let countSort = count.sorted(by: { $0.value > $1.value})
    var sum = 0
    for (i, c) in countSort.enumerated(){
        if(sum + c.value >= k){
            return i+1
        }
        sum += c.value
    }
    return countSort.count
}
