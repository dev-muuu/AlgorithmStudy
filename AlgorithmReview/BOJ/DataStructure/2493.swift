//
//  2493.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/03.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    let towers = readLine()!.split(separator: " ").map{ Int($0)! }
    
    //tower id들 저장
    var maxStack = [0]
    var minStack = [Int]()
    
    var ans = "0"
    for i in stride(from: 1, to: n, by: +1){
        
        let current = towers[i]
        
        if towers[maxStack.last!] < current{
            ans.write(" 0")
            maxStack.append(i); continue
        }
        
        let min = minStack.isEmpty ? 0 : towers[minStack.last!]
        if current > min || minStack.isEmpty {
            ans.write(" \(maxStack.last! + 1)")
        } else {
            if minStack.last! > maxStack.last! {
                ans.write(" \(minStack.last! + 1)")
            } else {
                ans.write(" \(maxStack.last! + 1)")
            }
        }
        minStack.append(i)
    }
    print(ans)
}

/*
 반례
 10
 2 9 3 8 7 4 6 5 1 10
 
 정답
 0 0 2 2 4 5 5 7 8 0
 */
