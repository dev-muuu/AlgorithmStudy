//
//  메뉴 리뉴얼.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/23.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {

    var dishes = [[String: Int]](repeating: [String: Int](), count: 11)
    let maxCourseCount = course.max()!
    
    func makeCombination(_ order: [String]){
        
        var tempDish = [Set<String>](repeating: Set(), count: 11)
        
        func combination(_ dish: String, _ index: Int){
            tempDish[dish.count].insert(dish)
            if dish.count == maxCourseCount {
                return
            }
            if index >= order.count{
                return
            }
            for i in stride(from: index, to: order.count, by: +1){
                combination(dish + order[i], i+1)
            }
        }
        
        for i in 0..<order.count{
            combination(order[i], i + 1)
        }
        for i in course{
            for d in tempDish[i]{
                dishes[i][d] = (dishes[i][d] ?? 0) + 1
            }
        }
    }
    
    for order in orders {
        makeCombination(Array(order).map{ String( $0 )}.sorted(by: <))
    }
    
    var ans = [String]()
    for i in course{
        var maxValue = 0
        for j in dishes[i].sorted(by: { $0.value > $1.value }){
            if maxValue <= j.value && j.value >= 2{
                maxValue = j.value
                ans.append(j.key)
            } else {
                break
            }
        }
    }

    return ans.sorted(by: <)
}


func solution(_ orders:[String], _ course:[Int]) -> [String] {

    //메뉴 조합 찾기
    var courseBool = [Bool](repeating: false, count: 11)
    for i in course {
        courseBool[i] = true
    }
    
    var courseMap = [[String:Set<Int>]](repeating: [:], count: 11)
    for (i,order) in orders.enumerated() {
        
        let order = Array(order).sorted(by: <)
        
        func combination(_ menu: String, _ index: Int) {

            if courseBool[menu.count] {
                if courseMap[menu.count][menu] == nil {
                    courseMap[menu.count][menu] = []
                }
                courseMap[menu.count][menu]!.insert(i)
            }
            
            if index >= order.count { return }
            
            for i in index..<order.count {
                combination(menu + String(order[i]), i+1)
                combination(menu, i+1)
            }
        }
        
        combination("", 0)
    }
    
    var candidate = [String]()
    for i in course {
        let countFilter = courseMap[i].filter{ $0.value.count > 1 }
        let maxValue = countFilter.max(by: { $0.value.count < $1.value.count })?.value.count ?? 21
        for (key, _) in countFilter.filter{ $0.value.count == maxValue } {
            candidate.append(key)
        }
    }
    
    return candidate.sorted(by: { $0 < $1 })
}
