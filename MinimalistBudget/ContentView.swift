//
//  ContentView.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                PlusButton {
                    showSheet.toggle()
                }
            }
            .padding()
        }
        .sheet(isPresented: $showSheet) {
            Text("Hello World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct PlusButton: View {
    
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            ZStack {
                Circle().frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }

    }
}
