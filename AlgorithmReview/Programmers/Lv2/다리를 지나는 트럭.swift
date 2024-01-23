//
//  다리를 지나는 트럭.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/26.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {

    var cross = [(Int, Int)]() //(인덱스, 다리에 올라온 시간)
    var next = 0 //다음에 올라올 트럭 포인터
    var weightSum = 0 //다리에 올라와 있는 트럭들 무게 총합
    var time = 0
    
    repeat {
        
        time += 1
        
        //지난 트럭 제거
        if !cross.isEmpty && cross.first!.1 + bridge_length == time {
            let pass = cross.removeFirst()
            weightSum -= truck_weights[pass.0]
        }
        
        //새로운 트럭 추가
        if next < truck_weights.count && weightSum + truck_weights[next] <= weight {
            weightSum += truck_weights[next]
            cross.append((next, time))
            next += 1
        }
        
    } while !cross.isEmpty
    
    return time
}
