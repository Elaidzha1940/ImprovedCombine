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
        
        // Filter / Reducing Operations
        /*
        
        // .map({ String($0) })
        // .tryMap({ int in
        // if int == 5 {
        // throw URLError(.badServerResponse)
        // }
        // return String(int)
        // })
        // .compactMap({ int in
        // if int == 5 {
        // return nil
        // }
        // return  "\(int)" //String(int)
        // })
        // .tryCompactMap()
        // .filter({ ($0 > 5) && ($0 < 7)})
        // .tryFilter()
        // .removeDuplicates()
        // .removeDuplicates(by: { int1, int2 in
        // return int1 = int2
        // }
        // .tryRemoveDuplicates(by: )
        // .replaceNil(with: 3)
        // .replaceEmpty(with: [])
        // .replaceError(with: "Default Value")
        // .scan(1, { existinfValue, newValue in
        // return existinfValue + newValue
        // })
        // .scan(0, { $0 + $1})
        // .scan(0, +)
        // .tryScan(throw, and error)
        // .reduce(0, {existinfValue, newValue in
        // return existinfValue + newValue
        // })
        // .reduce(0, +)
        // .collect()
        // .collect(2)
        // .tryAllSatisfy(throw, and error)
        // .allSatisfy({ $0 < 12 })

        */
        
        // Timing Operations
        /*
         
            // .debounce(for: 0.75, scheduler: DispatchQueue.main)
            // .delay(for: 2, scheduler: DispatchQueue.main)
            // .measureInterval(using: DispatchQueue.main)
            // .map({ stride in
            // return "\(stride.timeInterval)"
            // })
            // .throttle(for: 10, scheduler: DispatchQueue.main, latest: true)
            //.retry(2)
            // .timeout(0.75, scheduler: DispatchQueue.main)
         
        */
        
        // Multiple Publisher / Subscribers
        
            // .combineLatest(dataService.boolPublisher, dataService.intPublisher)
            // .compactMap({ (int, bool) in
            // if bool {
            // return String(int)
            // }
            // return nil
            // })
            //.compactMap({ $1 ? String($0) : "n/a" })
            // .compactMap({ (int1, bool, int2) in
            // if bool {
            // return String(int1)
            // } else {
            // return "n/a"
            // }
            // })
            // .merge(with: dataService.intPublisher)
            .zip(dataService.boolPublisher, dataService.intPublisher)
            .map({ tuple in
                return String(tuple.0) + tuple.1.description + String(tuple.2)
            })
        
            //.map({ String($0) })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR \(error)"
                }
            } receiveValue: { [weak self] returnedValue in
                //self?.data = returnedValue
                //self?.data.append(contentsOf: returnedValue)
                self?.data.append(returnedValue)
            }
            .store(in: &cancellables)
        
    }
}

