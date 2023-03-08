//
//  카드 뭉치.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/08.
//

import Foundation

func solution1(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {

    var card1Index = 0
    var card2Index = 0
    var goalIndex = 0

    while(card1Index < cards1.count && card2Index < cards2.count && goalIndex < goal.count){
        if(goal[goalIndex] == cards1[card1Index]){
            card1Index += 1
            goalIndex += 1
        }else if(goal[goalIndex] == cards2[card2Index]){
            card2Index += 1
            goalIndex += 1
        }else{
            return "No"
        }
    }

    while(card1Index < cards1.count && goalIndex < goal.count){
        if(goal[goalIndex] == cards1[card1Index]){
            card1Index += 1
            goalIndex += 1
        }else{
            return "No"
        }
    }

    while(card2Index < cards2.count && goalIndex < goal.count){
        if(goal[goalIndex] == cards2[card2Index]){
            card2Index += 1
            goalIndex += 1
        }else{
            return "No"
        }
    }

    return "Yes"
}

func solution2(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var card1Index = 0
    var card2Index = 0
    var goalIndex = 0
    
    while(goalIndex < goal.count){
        if(card1Index < cards1.count && goal[goalIndex] == cards1[card1Index]){
            card1Index += 1
            goalIndex += 1
        }else if(card2Index < cards2.count && goal[goalIndex] == cards2[card2Index]){
            card2Index += 1
            goalIndex += 1
        }else{
            return "No"
        }
    }
    
    return "Yes"
}
