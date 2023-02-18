//
//  K번째 수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/18.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/42748

import Foundation

func solution1(_ array:[Int], _ commands:[[Int]]) -> [Int] {

    var result = [Int]()
    for i in commands{
        let start = i[0] - 1
        let end = i[1] - 1
        let index = i[2] - 1
        let sliceAndSort = array[start...end].sorted{ $0 < $1 }
        result.append(sliceAndSort[index])
    }
    return result
}

func solution2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map{
        let start = $0[0] - 1
        let end = $0[1] - 1
        let index = $0[2] - 1
        let sliceAndSort = array[start...end].sorted{ $0 < $1 }
        return sliceAndSort[index]
    }
}
