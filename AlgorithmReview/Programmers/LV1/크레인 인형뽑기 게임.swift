//
//  크레인 인형뽑기 게임.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/10.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {

    var rowPointer = [Int](repeating: board.count, count: board[0].count)
    for i in 0..<board[0].count{
        for j in 0..<board.count{
            if(board[j][i] != 0){
                rowPointer[i] = j
                break
            }
        }
    }

    var stack = [Int]()
    var result = 0
    for i in moves{
        if(rowPointer[i-1] < board.count){
            let newElement = board[rowPointer[i-1]][i-1]
            rowPointer[i-1] += 1

            if(!stack.isEmpty){
                let last = stack.last!
                if(last == newElement){
                    stack.removeLast()
                    result += 2
                    continue
                }
            }
            stack.append(newElement)
        }
    }
    return result
}
