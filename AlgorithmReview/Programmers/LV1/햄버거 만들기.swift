//
//  햄버거 만들기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/13.
//

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    
    var ingredient = ingredient
    var index = 0
    var result = 0
    while(index + 3 < ingredient.count){
        if(ingredient[index] == 1 && Array(ingredient[index...index+3]) == [1,2,3,1]){
            for _ in 1...4{
                ingredient.remove(at: index)
            }
            result += 1
            if(ingredient.count != index){
                if(index > 0 && ingredient[index] == 2){
                    index -= 1
                }
                else if(index > 1 && ingredient[index] == 3){
                    index -= 2
                }
            }
        }else{
            index += 1
        }
    }
    return result
}

func reference(_ ingredient:[Int]) -> Int {
    var stacks: [Int] = []
    var count: Int = 0
    for ingredient in ingredient {
        stacks.append(ingredient)
        let suffix = stacks.suffix(4)
        if suffix == [1,2,3,1] {
            count += 1
            stacks.removeLast(4)
        }
    }
    return count
}
