//
//  2629.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/20.
//

import Foundation

var dp = [[Bool]](repeating: [Bool](repeating: false, count: 15001), count: 31)
var n: Int!
var weights: [Int]!

func solve(){
    n = Int(readLine()!)!
    weights = readLine()!.split(separator: " ").map({ Int($0)! })
    weights.append(contentsOf: [Int](repeating: 0, count: 31 - weights.count))
    
    let m = Int(readLine()!)!
    let marbles = readLine()!.split(separator: " ").map({ Int($0)! })
    
    circuit(i: 0, w: 0)
    
    var result = ""
    for i in marbles{
        if(i > 15000){
            result.write("N ")
            print("N ", terminator: "")
        }else if(dp[n][i]){
            result.write("Y ")
        }else{
            result.write("N ")
        }
    }
    print(result.trimmingCharacters(in: .whitespaces))
}

func circuit(i: Int, w: Int){
    
    if(i > n || dp[i][w]){
        return
    }
    dp[i][w] = true
    circuit(i: i+1, w: w + weights[i])
    circuit(i: i+1, w: abs(w - weights[i]))
    circuit(i: i+1, w: w)
}
