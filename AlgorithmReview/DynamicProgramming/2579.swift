//
//  2579.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/13.
//

import Foundation

func solve(){
    
    let n = Int(readLine()!)!
    
    var score = [Int](repeating: 0, count: 301)
    for i in 1...n{
        score[i] = Int(readLine()!)!
    }
    
    var dp = [Int](repeating: 0, count: 301)
    dp[1] = score[1]
    dp[2] = max(score[2], score[1] + score[2])
    dp[3] = max(score[1] + score[3], score[2] + score[3])
    
    if(n < 4){
        print(dp[n])
        exit(0)
    }
    
    for i in 4...n{
        dp[i] = max(dp[i-2], dp[i-3] + score[i-1]) + score[i]
    }
    print(dp[n])
}

//solve()
