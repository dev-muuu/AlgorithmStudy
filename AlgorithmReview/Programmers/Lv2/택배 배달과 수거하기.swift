//
//  택배 배달과 수거하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/24.
//

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int {

    var deliveries = deliveries
    var pickups = pickups
    
    var ans = 0
    var deliverP = deliveries.count-1, pickupP = deliveries.count-1
    while deliverP >= 0 && deliveries[deliverP] == 0 {
        deliverP -= 1
    }
    while pickupP >= 0 && pickups[pickupP] == 0 {
        pickupP -= 1
    }
    
    while deliverP >= 0 || pickupP >= 0{
        var tempCap = (0,0) //delive, pickup
        let move = max(deliverP, pickupP) + 1
        while tempCap.0 < cap && deliverP >= 0{
            if tempCap.0 + deliveries[deliverP] <= cap {
                tempCap.0 += deliveries[deliverP]
                deliveries[deliverP] = 0
            } else {
                deliveries[deliverP] -= cap - tempCap.0
                tempCap.0 = cap
            }
            
            while deliverP >= 0 && deliveries[deliverP] == 0 {
                deliverP -= 1
            }
        }
        
        while tempCap.1 < cap && pickupP >= 0{
            if tempCap.1 + pickups[pickupP] <= cap {
                tempCap.1 += pickups[pickupP]
                pickups[pickupP] = 0
            } else {
                pickups[pickupP] -= cap - tempCap.1
                tempCap.1 = cap
            }
            
            while pickupP >= 0 && pickups[pickupP] == 0 {
                pickupP -= 1
            }
        }
        ans += move * 2
    }
    return ans
}import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int {

    var deliveries = deliveries
    var pickups = pickups
    
    var ans = 0
    var deliverP = deliveries.count-1, pickupP = deliveries.count-1
    while deliverP >= 0 && deliveries[deliverP] == 0 {
        deliverP -= 1
    }
    while pickupP >= 0 && pickups[pickupP] == 0 {
        pickupP -= 1
    }
    
    while deliverP >= 0 || pickupP >= 0{
        var tempCap = (0,0) //delive, pickup
        let move = max(deliverP, pickupP) + 1
        while tempCap.0 < cap && deliverP >= 0{
            if tempCap.0 + deliveries[deliverP] <= cap {
                tempCap.0 += deliveries[deliverP]
                deliveries[deliverP] = 0
            } else {
                deliveries[deliverP] -= cap - tempCap.0
                tempCap.0 = cap
            }
            
            while deliverP >= 0 && deliveries[deliverP] == 0 {
                deliverP -= 1
            }
        }
        
        while tempCap.1 < cap && pickupP >= 0{
            if tempCap.1 + pickups[pickupP] <= cap {
                tempCap.1 += pickups[pickupP]
                pickups[pickupP] = 0
            } else {
                pickups[pickupP] -= cap - tempCap.1
                tempCap.1 = cap
            }
            
            while pickupP >= 0 && pickups[pickupP] == 0 {
                pickupP -= 1
            }
        }
        ans += move * 2
    }
    return ans
}
