//
//  거리두기 확인하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/17.
//

import Foundation

func solution1(_ places:[[String]]) -> [Int] {
    
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

func solution2(_ places:[[String]]) -> [Int] {
    
    var ans = [Int]()
    
    for place in places {
        
        var isValid = true
        let place = place.map{ Array($0) }

        for i in 0..<5 {
            for j in 0..<5 {
                
                if place[i][j] != "P" { continue }
                
                if (j+2 < 5 && place[i][j+2] == "P" && place[i][j+1] != "X")
                || (i+2 < 5 && place[i+2][j] == "P" && place[i+1][j] != "X")
                || ((i+1 < 5 && j+1 < 5 && place[i+1][j+1] == "P") && (place[i][j+1] != "X" || place[i+1][j] != "X"))
                || ((i+1 < 5 && j-1 >= 0 && place[i+1][j-1] == "P" ) && (place[i][j-1] != "X" || place[i+1][j] != "X"))
                || (j+1 < 5 && place[i][j+1] == "P" || i+1 < 5 && place[i+1][j] == "P") {
                    isValid = false
                    break
                }
            }
            if !isValid {
                break
            }
        }
        isValid ? ans.append(1) : ans.append(0)
    }
    return ans
}
