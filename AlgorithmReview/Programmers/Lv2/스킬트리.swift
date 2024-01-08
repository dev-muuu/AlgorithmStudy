//
//  스킬트리.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/19.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {

    let skill = Array(skill)
    let skillElement = Set<Character>(skill)
    var answer = 0
    
    for target in skill_trees {
        
        let target = Array(target)
        
        var sPoint = 0, tPoint = 0
        var isValid = true
        
        while sPoint < skill.count && tPoint < target.count {
            if skill[sPoint] == target[tPoint] {
                sPoint += 1
                tPoint += 1
            }
            else if skillElement.contains(target[tPoint]) {
                isValid = false
                break
            }
            else {
                tPoint += 1
            }
        }
        
        if isValid { answer += 1 }
    }
    
    return answer
}
