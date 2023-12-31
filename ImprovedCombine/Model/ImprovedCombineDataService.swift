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
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let intPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    func publishFakeData() {
        //let items: [Int] = Array(1..<11)
        let items: [Int] = [1,2,3,4,5,6,7,8,9,10]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughpublisher.send(items[x])
                
                if (x > 3 && x < 6) {
                    self.boolPublisher.send(true)
                    self.intPublisher.send(99)
                } else {
                    self.boolPublisher.send(false)
                }
                
                if x == items.indices.last {
                    self.passThroughpublisher.send(completion: .finished/*.failure(Error)*/)
                }
            }
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//            self.passThroughpublisher.send(1)
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.passThroughpublisher.send(2)
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            self.passThroughpublisher.send(3)
//        }

    }
}
