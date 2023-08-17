//
//  거리두기 확인하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/17.
//

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    func valid(_ room: [[Character]], _ coord: (Int, Int)) -> Bool {
        if coord.0+1 < 5 && room[coord.0+1][coord.1] == "P" { return false }
        if coord.1+1 < 5 && room[coord.0][coord.1+1] == "P" { return false }
        if coord.0+1 < 5 && coord.1+1 < 5 && room[coord.0+1][coord.1+1] == "P" {
            if !(room[coord.0+1][coord.1] == "X" && room[coord.0+1][coord.1] == "X") { return false }
        }
        if coord.0+1 < 5 && coord.1-1 >= 0 && room[coord.0+1][coord.1-1] == "P" {
            if !(room[coord.0+1][coord.1] == "X" && room[coord.0][coord.1-1] == "X") { return false }
        }
        if coord.0+2 < 5 && room[coord.0+2][coord.1] == "P" {
            if room[coord.0+1][coord.1] == "O" { return false }
        }
        if coord.1+2 < 5 && room[coord.0][coord.1+2] == "P" {
            if room[coord.0][coord.1+1] == "O" { return false }
        }
        return true
    }
    
    var ans = [Int]()
    
    for room in places {
        let room = room.map{ Array($0) }
        var coord = (0, 0)
        var isValid = true
        while coord != (5,0) {
            if room[coord.0][coord.1] == "P" && !valid(room, coord) {
                isValid = false; break
            }
            if coord.1 == 4 {
                coord.0 += 1
                coord.1 = 0
            } else {
                coord.1 += 1
            }
        }
        isValid ? ans.append(1) : ans.append(0)
    }
    return ans
}
