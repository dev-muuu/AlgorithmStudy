//
//  롤케이크 자르기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/27.
//

import Foundation

func solution(_ topping:[Int]) -> Int {
    
    var toppingA = [Int:Int]()
    var toppingB = [Int:Int]()
    
    for i in topping {
        if toppingB[i] == nil {
            toppingB[i] = 0
        }
        toppingB[i]! += 1
    }
    
    var answer = 0
    for i in topping {
        
        if toppingA[i] == nil {
            toppingA[i] = 0
        }
        toppingA[i]! += 1
        
        if toppingB[i] == 1 {
            toppingB.removeValue(forKey: i)
        }
        else {
            toppingB[i]! -= 1
        }
        
        if toppingA.count == toppingB.count {
            answer += 1
        }
    }
    
    return answer
}
