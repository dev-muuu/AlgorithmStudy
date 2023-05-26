//
//  다리를 지나는 트럭.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/26.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {

    var time = 1, index = 1, totalWeight = truck_weights[0]
    var queue = [(1, totalWeight)] //들어간 시간, 무게
    
    while !queue.isEmpty{
        time += 1
        if !queue.isEmpty && time == queue.first!.0 + bridge_length{
            let pop = queue.removeFirst()
            totalWeight -= pop.1
        }
        if index < truck_weights.count && queue.count < bridge_length && totalWeight + truck_weights[index] <= weight{
            queue.append((time, truck_weights[index]))
            totalWeight += truck_weights[index]
            index += 1
        }
    }
    
    return time
}
