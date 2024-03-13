//
//  명예의 전당.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/01.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var answer = [Int]()
    var board = [Int]()
    for s in score {
        if board.count < k {
            board.append(s)
        }
        else if board.last! < s {
            board[k-1] = s
        }
        board.sort(by: >)
        answer.append(board.last!)
    }
    return answer
}
