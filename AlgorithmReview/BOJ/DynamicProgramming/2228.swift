//
//  2228.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/22.
//

import Foundation

func solve(){
    
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    let n = input[0]
    let m = input[1]
    
    var con = [[Int]](repeating: [Int](repeating: -Int.max, count: m+1), count: n+1)
    var notcon = [[Int]](repeating: [Int](repeating: -Int.max, count: m+1), count: n+1)
    con[0][0] = 0
    notcon[0][0] = 0
    
    for i in 1...n{
        let num = Int(readLine()!)!
        for j in 1...min(m, i+1 / 2){
            con[i][j] = max(con[i-1][j], notcon[i-1][j-1]) + num
            notcon[i][j] = max(con[i-1][j], notcon[i-1][j])
        }
    }
    print(max(con[n][m], notcon[n][m]))
}
