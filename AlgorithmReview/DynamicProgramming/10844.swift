//
//  10844.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/14.
//

import Foundation

func solve(){
    
    let n = Int(readLine()!)!
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101)
    
    //initialize
    for i in 1...9{
        dp[1][i] = 1
    }
    
    if (n < 2){
        print(dp[n].reduce(0, { $0 + $1 }))
        exit(0)
    }
    
    for i in 2...n{
        for j in 0...9{
            if(j == 0){
                dp[i][j] = (dp[i-1][1]) % 1000000000
            }else if(j == 9){
                dp[i][j] = (dp[i-1][8]) % 1000000000
            }else{
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
            }
        }
    }
    print(dp[n].reduce(0, { $0 + $1 }) % 1000000000)
}

//solve()
