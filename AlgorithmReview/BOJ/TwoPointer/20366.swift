//
//  20366.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/06.
//

import Foundation

func solve(){
    
    struct SnowBall{
        let id1: Int
        let id2: Int
        let length: Int
    }
    
    let n = Int(readLine()!)!
    let ball = readLine()!.split(separator: " ").map({ Int($0)! })
    
    var snowBall = [SnowBall]()
    for i in 0..<n{
        for j in i+1..<n{
            snowBall.append(SnowBall(id1: i, id2: j, length: ball[i] + ball[j]))
        }
    }
    snowBall.sort(by: { $0.length < $1.length })
    
    var result = Int.max
    var start = 0
    var end = 1

    while(end < snowBall.count){
        
        if(snowBall[end].id1 == snowBall[start].id1 || snowBall[end].id1 == snowBall[start].id2 || snowBall[end].id2 == snowBall[start].id1 || snowBall[end].id2 == snowBall[start].id2){
            end += 1
            continue
        }

        result = min(result, abs(snowBall[start].length - snowBall[end].length))
        start += 1
        end = start + 1
    }
    print(result)
}
