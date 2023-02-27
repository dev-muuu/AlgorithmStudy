//
//  21941.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/27.
//

import Foundation

func solve(){
    
    let fileIO = FileIO()
    
    let string = Array(fileIO.readString())
    let count = fileIO.readInt()
    
    var mapping = [String: Int]()
    for _ in 1...count{
        mapping[fileIO.readString()] = fileIO.readInt()
    }
    
    var dp = [Int](repeating: 0, count: string.count+1)
    for i in 0..<string.count{
        
        dp[i+1] = max(dp[i+1], dp[i] + 1)
        
        let filter = mapping.keys.filter{ i+$0.count <= string.count && $0 == String(string[i...i+$0.count-1])}
        for k in filter{
            dp[i + k.count] = max(dp[i + k.count], dp[i] + mapping[k]!)
        }
    }

    print(dp[string.count])
}

/*
 for i in 1...string.count+1{
 
    dp[i] = max(dp[i-1], dp[i])
 
    if(i == string.count + 1){
      break
    }
 
    ...
 
    dp[i] += 1
 */
