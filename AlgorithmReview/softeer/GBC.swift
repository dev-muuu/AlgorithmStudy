//
//  GBC.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2024/02/02.
//

import Foundation

let size = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (size[0], size[1])

var limit = [Int](repeating: 0, count: 101)
var p = 1
for _ in 0..<n {
    let data = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in p..<p+data[0] {
        limit[j] = data[1]
    }
    p = p+data[0]
}

p = 1
var answer = 0
for _ in 0..<m {
    let data = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in p..<p+data[0]{
        if limit[j] < data[1] {
            answer = max(answer, data[1]-limit[j])
        }
    }
    p = p+data[0]
}

print(answer)

/*
Test 1
3 3
50 50
40 40
10 30
60 76
18 28
22 50
*/

/*
Test 2
3 3
50 90
10 90
40 50
50 40
10 100
40 40
*/
