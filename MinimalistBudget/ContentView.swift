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
        VStack(alignment: .leading) {
            VStack {
                Title(totalAmount: 500)
                CategoryLine(text: "Besoins", color: .green)
                CategoryLine(text: "Désirs", color: .orange)
                CategoryLine(text: "Envies", color: .red)
            }
            .padding()
            .background(roundedBackground)
            
            Spacer()
            
            HStack {
                Spacer()
                PlusButton {
                    showSheet.toggle()
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .sheet(isPresented: $showSheet) {
            Text("Hello World")
        }
    }
    
    var roundedBackground: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke()
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

struct Title: View {
    var totalAmount: Int
    
    var body: some View {
        HStack {
            Text("Total Dépensé")
                .bold()
                .font(.title2)
            Spacer()
            Text("\(totalAmount)€")
                .bold()
                .font(.title2)
        }
    }
}

struct CategoryLine: View {
    let text: String
    let color: Color
    
    var body: some View {
        HStack {
            ZStack {
                Text(text.firstLetter)
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .foregroundColor(color)
                            .frame(width: 30, height: 30)
                    )
            }
            .frame(width: 30, height: 30)
            
            Text(text)
            
            Spacer()
            
            Text("55€")
                .bold()
        }
    }
}

extension String {
    var firstLetter: String {
        return "\(self.prefix(1))"
    }
}
