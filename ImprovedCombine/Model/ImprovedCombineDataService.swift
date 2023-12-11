//  /*
//
//  Project: ImprovedCombine
//  File: ImprovedCombineDataService.swift
//  Created by: Elaidzha Shchukin
//  Date: 11.12.2023
//
//  */

import Foundation
import Combine

class ImprovedCombineDataService {
    
    //@Published var basicPublisher: String = "first publish"
    //let currentValuePublisher = CurrentValueSubject<Int, Error>("first publish")
    let passThroughpublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    func publishFakeData() {
        let items: [Int] = Array(0..<11)
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughpublisher.send(items[x])
                
                if x == items.indices.last {
                    self.passThroughpublisher.send(completion: .finished/*.failure(Error)*/)
                }
            }
        }
    }
}
