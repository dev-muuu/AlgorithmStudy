//
//  다트 게임.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/28.
//

import Foundation

func solution(_ dartResult:String) -> Int {

    var dart = Array(dartResult)
    var score = [Int]()

    var index = 0
    var scoreIndex = -1
    while(index < dart.count){

        let str = String(dart[index])

        if(dart[index].isNumber){
            scoreIndex += 1
            if(dart[index + 1].isNumber){
                score.append(10)
                index += 2
                continue
            }
            score.append(Int(str)!)
            index += 1
            continue
        }

        let value = score[scoreIndex]
        switch str{
            case "D":
            score[scoreIndex] *= value
            break
            case "T":
            score[scoreIndex] *= value * value
            break
            case "*":
            if(scoreIndex > 0){
                score[scoreIndex - 1] *= 2
            }
            score[scoreIndex] *= 2
            break
            case "#":
            score[scoreIndex] = -value
            break
            default:
            break
        }

        index += 1
    }

    return score.reduce(0){ $0 + $1 }
}
