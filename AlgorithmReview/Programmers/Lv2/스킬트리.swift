//
//  스킬트리.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/19.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var count = 0
    for curri in skill_trees{
        
        let filter = Array(curri.filter{ skill.contains($0) })
        let skill = Array(skill)
        
        var validation = true
        var skillIndex = 0, filterIndex = 0
        
        while skillIndex < skill.count && filterIndex < filter.count {
            if skill[skillIndex] == filter[filterIndex] {
                skillIndex += 1
                filterIndex += 1
            } else {
                validation = false; break
            }
        }
        if validation{
            count += 1
        }
    }
    return count
}

func reference(_ skill:String, _ skill_trees:[String]) -> Int {

    func available(_ s: String, _ t: String) -> Bool {
        let alza = t.filter { s.contains($0) }
        return s.starts(with: alza)
    }

    return skill_trees.map { available(skill, $0) }.filter { $0 }.count
}
