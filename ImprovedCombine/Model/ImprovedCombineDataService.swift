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
    
    @Published var basicPublisher: [String] = []
    
    init() {
        publishFakeData()
    }
    
    func publishFakeData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.basicPublisher = ["white", "black", "blue"]
        }
    }
}
