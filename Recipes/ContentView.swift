//
//  ContentView.swift
//  Recipes
//
//  Created by Don Bouncy on 11/11/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack{
            RecipesView(nM: networkManager)
        }.onAppear(perform: networkManager.fetchData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
