//
//  숫자 카드 나누기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/21.
//

import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a%b)
    }
    
    var gcdA = arrayA[0]
    for i in stride(from: 1, to: arrayA.count, by: +1) {
        gcdA = gcd(gcdA, arrayA[i])
    }
    
    var resultA = gcdA
    for i in arrayB{
        if i % gcdA == 0 {
            resultA = 1; break
        }
    }
    
    var gcdB = arrayB[0]
    for i in stride(from: 1, to: arrayB.count, by: +1) {
        gcdB = gcd(gcdB, arrayB[i])
    }
    
    var resultB = gcdB
    for i in arrayA{
        if i % gcdB == 0 {
            resultB = 1; break
        }
    }
    
    if resultA > resultB {
        return resultA
    } else if resultA == resultB {
        return 0
    } else {
        return resultB
    }
}
