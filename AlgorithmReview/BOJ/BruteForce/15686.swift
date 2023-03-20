//
//  15686.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation

func combination(_ data: [(Int, Int)], size: Int) -> [[(Int, Int)]]{
    
    var result = [[(Int, Int)]]()
    if(data.count < size){
        return result
    }
    
    func makeCombination(index: Int, current: [(Int, Int)]){
        if(current.count == size){
            result.append(current)
            return
        }
        
        for i in index..<data.count{
            makeCombination(index: i+1, current: current + [data[i]])
        }
    }
    makeCombination(index: 0, current: [])
    return result
}

func solve(){
    
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var houses = [(Int, Int)]()
    var chickenStores = [(Int, Int)]()
    
    for i in 0..<info[0]{
        let map = readLine()!.split(separator: " ")
        for (j, value) in map.enumerated(){
            if(value == "2"){
                chickenStores.append((i, j))
            }else if(value == "1"){
                houses.append((i, j))
            }
        }
    }
    
    var ans = Int.max
    for remainStores in combination(chickenStores, size: info[1]){
        var sum = 0
        for home in houses{
            var minDistance = Int.max
            for chicken in remainStores{
                minDistance = min(minDistance, abs(home.0 - chicken.0) + abs(home.1 - chicken.1))
            }
            sum += minDistance
        }
        ans = min(sum, ans)
    }
    print(ans)
}
