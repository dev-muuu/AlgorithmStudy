//
//  2293.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/15.
//

import Foundation

func solve(){
    
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    let n = input[0]
    let total = input[1]
    
    var price = [Int](repeating: 0, count: 101)
    for i in 1...n{
        price[i] = Int(readLine()!)!
    }
    
    var dp = [Int](repeating: 0, count: 10001)
    dp[0] = 1
    for i in price[1...n]{
        var j = i
        while(j <= total){
            let value = dp[j] + dp[j-i]
            dp[j] = value > Int(pow(2.0, 31.0)) ? 0 : value
            j = j+1
        }
    }
    print(dp[total])
}
