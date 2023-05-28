//
//  가장 큰 수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/28.
//

import Foundation

func solution1(_ numbers:[Int]) -> String {
    
    var string = numbers.map{ String($0) }
    
    let ans = string.sorted(by: {
        let a = Array($0), b = Array($1)
        for i in 0..<min(a.count, b.count){
            if a[i] == b[i] {
                continue
            }
            return a[i] > b[i]
        }
        return $0 + $1 > $1 + $0
    })
    return ans.allSatisfy{ $0 == "0" } ? "0" : ans.joined()
}

func solution2(_ numbers:[Int]) -> String {
    var string = numbers.map{ String($0) }
    let ans = string.sorted(by: {
        return $0 + $1 > $1 + $0
    })
    return ans.first! == "0" ? "0" : ans.joined()
}
