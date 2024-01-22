//
//  가장 큰 수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/28.
//

import Foundation

func solution1(_ numbers:[Int]) -> String {
    if numbers.allSatisfy({$0 == 0}) {
        return "0"
    }
    let sorted = numbers.map { String($0) }.sorted(by: { $0 + $1 > $1 + $0 })
    return sorted.reduce(""){ $0 + $1 }
}

func solution2(_ numbers:[Int]) -> String {
    var string = numbers.map{ String($0) }
    let ans = string.sorted(by: {
        return $0 + $1 > $1 + $0
    })
    return ans.first! == "0" ? "0" : ans.joined()
}
