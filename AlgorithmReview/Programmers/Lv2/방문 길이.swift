//
//  방문 길이.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/18.
//

import Foundation

func solution(_ dirs:String) -> Int {
    
    func nextCoord(_ direction: (Int, Int)) -> (Int, Int){
        let next = (current.0 + direction.0, current.1 + direction.1)
        if next.0 < -5 || next.0 > 5 || next.1 > 5 || next.1 < -5 {
            return current
        } else {
            return next
        }
    }
    
    var visit = Set<[Int]>()
    
    var current:(Int, Int) = (0,0)
    for direction in dirs {
        let move: (Int, Int) = {
            switch direction{
                case "U":   return (0,1)
                case "D":   return (0,-1)
                case "R":   return (1,0)
                case "L":   return (-1,0)
                default:    exit(0)
            }
        }()
        
        let next = nextCoord(move)
        if next == current {
            continue
        } else {
            visit.insert([current.0, current.1, next.0, next.1])
            visit.insert([next.0, next.1, current.0, current.1])
        }
        current = next
    }
    return visit.count / 2
}
