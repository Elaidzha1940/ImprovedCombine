//  /*
//
//  Project: ImprovedCombine
//  File: ImprovedCombineViewModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 11.12.2023
//
//  */

import Foundation
import Combine

class ImprovedCombineViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var error: String = ""
    let dataService = ImprovedCombineDataService()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.passThroughpublisher
        
        // Sequence Operations
        /*
         
         // .first()
         // .first(where: { int in
         // return int > 5
         // })
         // .first(where: { $0 > 5 })
         // .tryFirst(where: { int in
         // if int == 3 {
         // throw URLError(.badServerResponse)
         // }
         // return int > 1
         // })
         // .last()
         // .last(where: { $0 < 3 })
         // .tryLast(where: { int in
         // if int == 15 {
         // throw URLError(.badServerResponse)
         // }
         // return int > 1
         // })
         // .dropFirst()
         // .dropFirst(5)
         // .drop(while: { $0 < 3 })
         // .drop(while: { int in
         // if int == 5 {
         // throw URLError(.badServerResponse)
         // }
         // return int > 1
         // })
         // .prefix(5)
         // .prefix(while: { $0 < 5 })
         // .tryPrefix(while: )
         // .output(at: 4)
         // .output(in: 2..<5)
         
         */
        
        // Mathematic Operations
        /*
         
         // .max()
         // .max(by: { int1, int2 in
         // return int1 < int2
         // })
         // .tryMax(by: )
         // .min()
         // .min(by: )
         // .tryMin(by: )
         
         */
        
        
        
            .map({ String($0) })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR \(error)"
                    //print()
                }
            } receiveValue: { [weak self] returnedValue in
                self?.data.append(returnedValue)
            }
            .store(in: &cancellables)
        
    }
}

