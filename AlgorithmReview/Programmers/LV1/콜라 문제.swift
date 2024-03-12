//
//  콜라 문제.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/20.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {

    var n = n
    var count = 0
    while(n / a > 0 ){
        count += n / a * b
        n = n / a * b + n % a
    }
    return count
}

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var answer = 0
    var coke = n
    while coke >= a {
        let remain = coke%a
        let newCoke = (coke - remain) / a * b
        answer += newCoke
        coke = newCoke + remain
    }
    return answer
}
