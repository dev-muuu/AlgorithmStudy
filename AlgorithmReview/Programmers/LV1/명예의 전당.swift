//
//  명예의 전당.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/01.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    
    var crown = [Int]()
    var minList = [Int]()
    
    for i in score{
        if(crown.count < k){
            crown.append(i)
        }else if(i > crown.first!){
            crown.removeFirst()
            crown.append(i)
        }
        crown.sort(by: <)
        minList.append(crown.first!)
    }

    return minList
}
