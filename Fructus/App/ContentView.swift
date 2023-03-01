//
//  ContentView.swift
//  Fructus
//
//  Created by Shun Ganas on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: BODY
    var body: some View {
        NavigationView{
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit:fruit)){
                        FruitRowView(fruit: fruit)
                            .padding(.vertical,4)
                    }
                }
            }//: LIST
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }//: BUTTON
                    .sheet(isPresented: $isShowingSettings){
                        SettingsView()
                    }
            )
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
