//
//  택배 상자.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/05.
//

import Foundation

func solution(_ order:[Int]) -> Int {

    var temp = [Int]()
    var orderIndex = 0
    for i in 1...order.count{

        var validation = false
        if i == order[orderIndex] {
            validation = true
            orderIndex += 1
        }

        while orderIndex < order.count && !temp.isEmpty && temp.last! == order[orderIndex] {
            temp.removeLast()
            orderIndex += 1
        }

        if !validation{
            temp.append(i)
        }
    }

    return orderIndex
}
