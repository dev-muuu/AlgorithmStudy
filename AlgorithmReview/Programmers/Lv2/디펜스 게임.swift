//
//  디펜스 게임.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/04.
//

import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var heap = Heap<Int>(sortFunction: >)
    var sum = 0, k = k
    for i in stride(from: 0, to: enemy.count, by: +1){
        heap.insert(enemy[i])
        sum += enemy[i]
        if sum > n{
            if k > 0 {
                let remove = heap.remove()!
                sum -= remove
                k -= 1
            }else {
                return i
            }
        }
    }
    return enemy.count
}

struct Heap<T: Comparable> {
    
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool // > : 최대, < : 최소
    var isEmpty: Bool {
        return self.elements.count == 1 || self.elements.count == 0
    }
    
    var peek: T? {
        if self.isEmpty { return nil }
        return self.elements[1]
    }
    
    var count: Int {
        return self.elements.count - 1
    }
    
    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        
        self.sortFunction = sortFunction
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    func parent(of index: Int) -> Int {
        return (index) / 2
    }
    
    private mutating func add(_ element: T) {
        self.elements.append(element)
    }
    
    private mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
            higherPriority = leftIndex
        }
        if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
            higherPriority = rightIndex
        }
        if higherPriority != index {
            self.elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }
    
    private mutating func swimUp(from index: Int) {
        var index = index
        while index != 1 && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
            self.elements.swapAt(index, self.parent(of: index))
            index = self.parent(of: index)
        }
    }
    
    private mutating func buildHeap() {
        for index in (1...(self.elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
    
    mutating func insert(_ node: T) {
        if self.elements.isEmpty {
            self.elements.append(node)
        }
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    
    mutating func remove() -> T? {
        if self.isEmpty { return nil }
        self.elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
}

