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
        
        //.first()
        //.first(where: { int in
        // return int > 5
        // })
        //.first(where: { $0 > 5 })
            .tryFirst(where: { int in
                if int == 3 {
                    throw URLError(.badServerResponse)
                }
                return int > 5
            })
        
            .map({ String($0) })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR \(error.localizedDescription)"
                    //print()
                }
            } receiveValue: { [weak self] returnedValue in
                self?.data.append(returnedValue)
            }
            .store(in: &cancellables)
        
    }
}

