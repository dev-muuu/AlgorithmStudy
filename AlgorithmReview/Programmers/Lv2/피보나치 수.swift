//
//  피보나치 수.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/21.
//

import Foundation

func solution(_ n:Int) -> Int {
    var fib = [Int?](repeating: nil, count: n+1)
    fib[0] = 0
    fib[1] = 1
    func fibonacci(_ n: Int) -> Int{
        if(fib[n] == nil){
            fib[n] = (fibonacci(n-1) + fibonacci(n-2)) % 1234567
        }
        return fib[n]!
    }
    return fibonacci(n)
}
