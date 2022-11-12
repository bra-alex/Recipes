//
//  RecipesView.swift
//  Recipes
//
//  Created by Don Bouncy on 11/11/2022.
//

import SwiftUI

struct RecipesView: View {
    @ObservedObject var nM: NetworkManager
    @State private var gridView = false
    
    var body: some View {
        Group {
            if gridView{
                GridView(nM: nM)
            } else {
                ListView(nM: nM)
            }
        }
        .navigationTitle("Recipes")
        .toolbar {
            Button {
                gridView.toggle()
            } label: {
                Image(systemName: gridView ? "list.bullet" : "square.grid.2x2")
            }
        }
    }
}


struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(nM: NetworkManager())
    }
}
