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

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    return Dictionary(grouping: tangerine) { $0 }.values
        .sorted { $0.count > $1.count }
        .reduce((0, 0)) { acc, array in acc.1 >= k ? acc : (acc.0 + 1, acc.1 + array.count) }
        .0
}
