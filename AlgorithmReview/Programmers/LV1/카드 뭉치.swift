//
//  카드 뭉치.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/08.
//

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var p1 = 0
    var p2 = 0
    var pG = 0
    
    while pG < goal.count {
        if p1 < cards1.count && goal[pG] == cards1[p1] {
            p1 += 1
        }
        else if p2 < cards2.count && goal[pG] == cards2[p2] {
            p2 += 1
        }
        else {
            return "No"
        }
        pG += 1
    }
    
    return "Yes"
}
