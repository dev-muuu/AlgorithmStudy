//
//  프렌즈4블록.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/22.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    struct Coord: Hashable {
        let x: Int
        let y: Int
    }
    
    //세로 기준으로 데이터 가공
    var board = board.map{ Array($0) }
    var stacks = [[Character]](repeating: [], count: n)
    for i in stride(from: m-1, to: -1, by: -1) {
        for j in 0..<n {
            stacks[j].append(board[i][j])
        }
    }
    
    //제거할 원소 찾기
    var ans = 0
    while true {
        
        var remove = Set<Coord>()
        
        for i in 0..<n{
            for j in 0..<m{
                
                let coords = [(i,j), (i+1,j), (i,j+1), (i+1, j+1)]
                
                func canRemove() -> Bool{
                    return coords.allSatisfy{ $0.0 < n && $0.1 < m && stacks[$0.0].count > $0.1 }
                    && coords.allSatisfy{ stacks[$0.0][$0.1] == stacks[i][j] }
                }
                
                if canRemove() {
                    coords.forEach {
                        remove.insert(Coord(x: $0.0, y: $0.1))
                    }
                }
            }
        }
        
        for coord in remove.sorted(by: { $0.y > $1.y }) {
            stacks[coord.x].remove(at: coord.y)
        }
        
        if remove.isEmpty { break }
        ans += remove.count
    }
    
    return ans
}
