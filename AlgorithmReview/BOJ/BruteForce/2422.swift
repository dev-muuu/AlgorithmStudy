//
//  2422.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/23.
//

import Foundation

func solve1(){
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    var combination = [[Int]](repeating: [Int](), count: info[0]+1)
    for _ in 1...info[1]{
        let comb = readLine()!.split(separator: " ").map{ Int($0)! }
        let small = min(comb[0], comb[1])
        let big = max(comb[0], comb[1])
        combination[small].append(big)
    }
    
    var ans = 0
    for i in 1...info[0]-2{
        let i_exc = combination[i]
        for j in i+1...info[0]-1{
            if(i_exc.contains(j)){
                continue
            }
            let j_exc = combination[j]
            for k in j+1...info[0]{
                if(j_exc.contains(k) || i_exc.contains(k)){
                    continue
                }
                ans += 1
            }
        }
    }
    print(ans)
}

func solve2(){
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    var combination = [[Bool]](repeating: [Bool](repeating: false, count: info[0]+1), count: info[0]+1)
    for _ in 1...info[1]{
        let comb = readLine()!.split(separator: " ").map{ Int($0)! }
        combination[comb[0]][comb[1]] = true
        combination[comb[1]][comb[0]] = true
    }
    
    var ans = 0
    for i in 1...info[0]-2{
        for j in i+1...info[0]-1{
            if(combination[i][j]){
                continue
            }
            for k in j+1...info[0]{
                if(combination[i][k] || combination[j][k]){
                    continue
                }
                ans += 1
            }
        }
    }
    print(ans)
}
