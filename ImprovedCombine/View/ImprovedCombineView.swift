//  /*
//
//  Project: ImprovedCombine
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 11.12.2023
//
//  */

import SwiftUI
import Combine

struct ImprovedCombineView: View {
    @StateObject private var vm = ImprovedCombineViewModel()
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(vm.data, id: \.self) {
                    Text($0)
                        .font(.system(size: 25, weight: .black, design: .rounded))
                }
                
                if !vm.error.isEmpty {
                    Text(vm.error)
                }
            }
        }
    }
}

#Preview {
    ImprovedCombineView()
}
