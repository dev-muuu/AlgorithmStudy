//
//  혼자서 하는 틱택토.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/10.
//

import Foundation

func solution(_ board:[String]) -> Int {

    let board = board.map{ Array($0) }
    
    var coordO = [(Int, Int)]()
    var coordX = [(Int, Int)]()
    for (i, row) in board.enumerated() {
        for (j, col) in row.enumerated() {
            if col == "O" {
                coordO.append((i, j))
            } else if col == "X"{
                coordX.append((i, j))
            }
        }
    }

    if coordX.count > coordO.count || coordO.count - coordX.count > 1 { return 0 }
    else if coordO.count == 0 && coordX.count == 0 { return 1}
    
    var checking = [[Character]](repeating: [Character](repeating: ".", count: 3), count: 3)
    var ans = false
    
    func isSatisfy(_ target: [Character]) -> Bool {
        target.allSatisfy({ $0 == "O"}) || target.allSatisfy({ $0 == "X"})
    }
    
    func isEnd() -> Bool {
        for row in checking {
            if isSatisfy(row) { return true }
        }
        for i in 0...2 {
            let target = checking.map{ $0[i] }
            if isSatisfy(target) { return true }
        }
        if isSatisfy((0...2).map{ checking[$0][$0] }) || isSatisfy((0...2).map{ checking[$0][2-$0] }) {
            return true
        }

        return false
    }
    
    func set(_ target: Character, _ count: Int){
        if isEnd() {
            if board == checking { ans = true }
            return
        } else if count == coordO.count + coordX.count{
            ans = true; return
        }
        
        if target == "O"{
            for coord in coordO{
                if checking[coord.0][coord.1] != "." { continue }
                checking[coord.0][coord.1] = "O"
                set("X", count + 1)
                checking[coord.0][coord.1] = "."
            }
        } else {
            for coord in coordX{
                if checking[coord.0][coord.1] != "." { continue }
                checking[coord.0][coord.1] = "X"
                set("O", count + 1)
                checking[coord.0][coord.1] = "."
            }
        }
    }
    
    for coord in coordO{
        checking[coord.0][coord.1] = "O"
        set("X", 1)
        checking[coord.0][coord.1] = "."
    }
    
    return ans ? 1 : 0
}
