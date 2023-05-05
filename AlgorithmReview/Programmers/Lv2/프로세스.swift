//
//  프로세스.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/05.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var sorted = priorities.sorted(by: <)
    var priorities = Array(priorities.enumerated())
    var count = 1
    
    while true {
        let pop = priorities.removeFirst()
        if sorted.last! > pop.element {
            priorities.append(pop)
        } else {
            if pop.offset == location {
                return count
            }
            sorted.removeLast()
            count += 1
        }
    }
    
    return count
}
