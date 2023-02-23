//
//  모의고사.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/23.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {

    let result = answers.enumerated().reduce([0,0,0]){

        var one = $0[0]
        var two = $0[1]
        var three = $0[2]

        if($1.offset % 5 + 1 == $1.element){
            one += 1
        }

        let twoIndex = $1.offset % 8
        let twoValidation = [2,1,2,3,2,4,2,5]
        if(twoValidation[twoIndex] == $1.element){
            two += 1
        }

        let threeIndex = ($1.offset % 10) / 2
        let threeValidation = [3,1,2,4,5]
        if(threeValidation[threeIndex] == $1.element){
            three += 1
        }

        return [one, two, three]
    }

    var max = 0
    var ans = [Int]()
    result.enumerated().map{
        if(max < $1){
            max = $1
            ans.removeAll()
            ans.append($0 + 1)
        }else if(max == $1){
            ans.append($0 + 1)
        }
    }

    return ans
}
