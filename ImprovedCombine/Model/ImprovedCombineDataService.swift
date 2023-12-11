//  /*
//
//  Project: ImprovedCombine
//  File: ImprovedCombineDataService.swift
//  Created by: Elaidzha Shchukin
//  Date: 11.12.2023
//
//  */

import Foundation

class ImprovedCombineDataService {
    
    @Published var basicPublisher: String = ""
    
    init() {
        publishFakeData()
    }
    
    func publishFakeData() {
        let items = ["white", "black", "blue"]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.basicPublisher = items[x]
            }
        }
    }
}
