//
//  9095.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/13.
//
// 1,2,3 더하기
// https://www.acmicpc.net/problem/9095
import Foundation

func solve(){
    
    let n = Int(readLine()!)!
    var result = [Int]()
    for i in 1...n{
        
        let m = Int(readLine()!)!
        
        var dp = [Int](repeating: 0, count: 11)
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        
        if(m < 4){
            result.append(dp[m])
            continue
        }
        
        for j in 4...m{
            dp[j] = dp[j-1] + dp[j-2] + dp[j-3]
        }
        result.append(dp[m])
    }
    
    result.forEach{
        print($0)
    }
}
