//
//  k진수에서 소수 개수 구하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/10.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    
    let radix = String(n, radix: k).split(separator: "0").map{ Int($0)! }

    func isPrime(_ value: Int) -> Bool {
        
        if value == 1 { return false }
        
        for i in stride(from: 2, to: Int(sqrt(Double(value))) + 1, by: +1) {
            if value % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    return radix.filter{ isPrime($0) }.count
}
