//
//  스마트 물류.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2024/02/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, k) = (input[0], input[1])

var data = Array(readLine()!)

var answer = 0
for i in 0..<n {
    if data[i] != "P" {
        continue
    }
    for j in i-k...i+k {
        if j < 0 || j >= n {
            continue
        }
        else if data[j] == "H"{
            answer += 1
            data[j] = "-"
            break
        }
    }
}

print(answer)

/*
20 1
HHPHPPHHPPHPPPHPHPHP
 */

/*
20 2
HHHHHPPPPPHPHPHPHHHP
*/

