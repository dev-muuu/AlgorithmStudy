//
//  15486.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/14.
//

import Foundation

func solve(){
    let n = Int(readLine()!)!
    
    var duration = [Int](repeating: 0, count: 15000002)
    var price = [Int](repeating: 0, count: 15000002)
    
    for i in 1...n{
        let data = readLine()!.split(separator: " ").map({ Int($0)! })
        duration[i] = data[0]
        price[i] = data[1]
    }
    
    var dp = [Int](repeating: 0, count: 15000002)
    for i in 1...n+1{
        let time = duration[i]
        dp[i] = max(dp[i-1], dp[i])
        dp[i + time] = max(price[i] + dp[i], dp[i + time])
    }
    print(dp[n+1])
}

//solve()
