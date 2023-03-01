//
//  20922.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/01.
//

import Foundation

func solve(){
    
    let info = readLine()!.split(separator: " ").map({ Int($0)! })
    let num = readLine()!.split(separator: " ").map({ Int($0)! })
    let n = info[0]
    let k = info[1]
    
    var start = 0
    var end = 0
    var maxLength = 0
    var numCount = [Int: Int]()
    
    while(end < n){
        
        let element = num[end]
        numCount[element] = numCount[element] == nil ? 1 : numCount[element]! + 1
        
        if(numCount[element]! <= k){
            end += 1
            continue
        }
        
        maxLength = max(maxLength, num[start..<end].count)
        while(num[start] != element){
            start += 1
        }
        start += 1
        end = start
        numCount.removeAll()
    }
    
    maxLength = max(maxLength, num[start..<end].count)
    print(maxLength)
}

func reference(){
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    let n = input[0]
    let limit = input[1]

    let array = readLine()!.split(separator: " ").map({ Int($0)! })
    var count = [Int](repeating: 0, count: 100001)

    var start = 0
    var end = 0
    var result = 0

    while(start < n){
        if(count[array[start]] != limit){
            count[array[start]] += 1
            start += 1
        }else{
            count[array[end]] -= 1
            end += 1
        }
        result = max(result, start - end)
    }
}
