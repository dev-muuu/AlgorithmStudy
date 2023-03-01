//
//  20922.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/01.
//

import Foundation

func solve(){
    
    let info = readLine()!.split(separator: " ").map({ Int($0)! })
    let n = info[0]
    let k = info[1]
    
    let num = readLine()!.split(separator: " ").map({ Int($0)! })
    
    
    var start = 0
    var end = 0
    var maxLength = 0
    var numCount = [Int: Int]()
    while(end < n){
        let element = num[end]
        if(numCount[element] == nil){
            numCount[element] = 0
        }
        numCount[element]! += 1
        
        if(numCount[element]! > k){
            maxLength = max(maxLength, num[start..<end].count)
            while(num[start] != element){
                start += 1
            }
            start += 1
            end = start
            numCount.removeAll()
        }else{
            end += 1
        }
    }
    
    maxLength =  max(maxLength, num[start..<end].count)
    print(maxLength)
}

