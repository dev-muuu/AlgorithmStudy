//
//  대충 만든 자판.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/15.
//

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {

    var indexMapping = [Character:Int]()
    for key in keymap{
        for (i, c) in key.enumerated(){
            if(indexMapping[c] == nil || i < indexMapping[c]!){
                indexMapping[c] = i + 1
            }
        }
    }

    var result = [Int]()
    for target in targets{
        var count = 0
        for c in target{
            if(indexMapping[c] == nil){
                count = 0
                break
            }
            count += indexMapping[c]!
        }
        count == 0 ? result.append(-1) : result.append(count)
    }
    return result
}
