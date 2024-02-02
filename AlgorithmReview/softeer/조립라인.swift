//
//  조립라인.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2024/02/02.
//

import Foundation

let n = Int(readLine()!)!

var work = [[Int]]()
var move = [[Int]]()
for _ in 1..<n {
    let data = readLine()!.split(separator: " ").map{ Int($0)! }
    work.append([data[0], data[1]])
    move.append([data[2], data[3]])
}
work.append(readLine()!.split(separator: " ").map{ Int($0)! })

var dpA = [Int](repeating: work[0][0], count: n)
var dpB = [Int](repeating: work[0][1], count: n)

for i in 1..<n{
    let (a,b) = (work[i][0], work[i][1])
    let (moveA, moveB) = (move[i-1][0], move[i-1][1])
    
    dpA[i] = min(dpA[i-1] + a, dpB[i-1] + moveB + a)
    dpB[i] = min(dpA[i-1] + moveA + b, dpB[i-1] + b)
}

print(min(dpA[n-1], dpB[n-1]))

/*
2
1 3 1 2
10 2
 */
