//
//  메뉴 리뉴얼.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/23.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {

    var courseBool = [Bool](repeating: false, count: 11)
    for i in course {
        courseBool[i] = true
    }
    
    var courseMap = [[String:Set<Int>]](repeating: [:], count: 11)
    for (i,order) in orders.enumerated() {
        
        let order = Array(order).sorted(by: <)
        
        func combination(_ menu: String, _ index: Int) {

            if courseBool[menu.count] {
                if courseMap[menu.count][menu] == nil {
                    courseMap[menu.count][menu] = []
                }
                courseMap[menu.count][menu]!.insert(i)
            }
            
            if index >= order.count { return }
            
            for i in index..<order.count {
                combination(menu + String(order[i]), i+1)
                combination(menu, i+1)
            }
        }
        
        combination("", 0)
    }
    
    var candidate = [String]()
    for i in course {
        let countFilter = courseMap[i].filter{ $0.value.count > 1 }
        let maxValue = countFilter.max(by: { $0.value.count < $1.value.count })?.value.count ?? 21
        for (key, _) in countFilter.filter{ $0.value.count == maxValue } {
            candidate.append(key)
        }
    }
    
    return candidate.sorted(by: { $0 < $1 })
}
