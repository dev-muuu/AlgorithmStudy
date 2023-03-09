//
//  키패드 누르기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/09.
//

import Foundation

func moveLeft(_ index: Int){
    result.write("L")
    left = index
}

func moveRight(_ index: Int){
    result.write("R")
    right = index
}

func calculateDistance(standard: Int, goal: Int) -> Int{
    return abs(goal / 3 - standard / 3) + abs(goal % 3 - standard % 3)
}

// * : 9, 0 : 10, #: 11로 매핑
var left = 9
var right = 11
var result = ""

func solution(_ numbers:[Int], _ hand:String) -> String {
        
    for i in numbers{
        if([1,4,7].contains(i)){
            moveLeft(i-1)
        }else if([3,6,9].contains(i)){
            moveRight(i-1)
        }else{
            var temp = i == 0 ? 10 : i-1
            let leftDistance = calculateDistance(standard: left, goal: temp)
            let rightDistance = calculateDistance(standard: right, goal: temp)
            if(leftDistance < rightDistance){
                moveLeft(temp)
            }else if(rightDistance < leftDistance){
                moveRight(temp)
            }else{
                hand == "left" ? moveLeft(temp) : moveRight(temp)
            }
        }
    }
    return result
}
