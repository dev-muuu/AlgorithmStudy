//
//  크레인 인형뽑기 게임.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/10.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    let row = board.count
    let col = board[0].count

    var rowPointer = [Int](repeating: row, count: col)
    for i in 0..<col{
        for j in 0..<row{
            if(board[j][i] != 0){
                rowPointer[i] = j
                break
            }
        }
    }

    var stack = [Int]()
    
    return moves.reduce(0){
        let index = $1 - 1
        if(rowPointer[index] < row){
            let newElement = board[rowPointer[index]][index]
            rowPointer[index] += 1
            if(!stack.isEmpty){
                let last = stack.last!
                if(last == newElement){
                    stack.removeLast()
                    return $0 + 2
                }
            }
            stack.append(newElement)
        }
        return $0
    }
}
