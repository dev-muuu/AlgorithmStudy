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

func reference(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5], // index % 5
        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
    }

    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
}
