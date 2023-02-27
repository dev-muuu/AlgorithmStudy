//
//  21941.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/27.
//

import Foundation

func solve(){
    
    let string = Array(readLine()!)
    let count = Int(readLine()!)!
    
    var mapping = [String: Int]()
    for _ in 1...count{
        let input = readLine()!.split(separator: " ").map( { String($0) })
        mapping[input[0]] = Int(input[1])!
    }
    
    var dp = [Int](repeating: 0, count: string.count+2)
    for i in 1...string.count+1{
        dp[i] = max(dp[i-1], dp[i])
        for k in mapping.keys{
            if(i+k.count <= string.count + 1 && k == String(string[i-1..<i+k.count-1])){
                dp[i + k.count] = max(dp[i + k.count], dp[i] + mapping[k]!)
            }
        }
        dp[i] += 1
    }

    print(dp[string.count + 1] - 1)
}
