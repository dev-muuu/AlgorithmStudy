//
//  옹알이2.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/08.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
    return babbling.reduce(0){
        return validation($1) ? $0 + 1 : $0
    }
}

func validation(_ string: String) -> Bool{

    var string = string.map{ String($0) }
    var index = 0

    let canSpeak = ["aya","ye","woo","ma"]

    func check(_ checkIndex: Int) -> Bool{
        if(index+canSpeak[checkIndex].count <= string.count && string[index..<index+canSpeak[checkIndex].count].joined() == canSpeak[checkIndex]){
            if(index - canSpeak[checkIndex].count >= 0 && string[index-canSpeak[checkIndex].count..<index].joined() == canSpeak[checkIndex]){
                return false
            }
            return true
        }
        return false
    }

    while(index < string.count){
        var checkIndex: Int
        switch string[index]{
            case "a":
            checkIndex = 0
            break
            case "y":
            checkIndex = 1
            break
            case "w":
            checkIndex = 2
            break
            case "m":
            checkIndex = 3
            break
            default:
            return false
        }

        if(check(checkIndex)){
            index += canSpeak[checkIndex].count
        }else{
            return false
        }
    }
    return index == string.count ? true : false
}
