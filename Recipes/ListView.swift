//
//  ListView.swift
//  Recipes
//
//  Created by Don Bouncy on 11/11/2022.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var nM: NetworkManager
    
    @State private var search = ""
    
    var searchResults: [Recipes] {
        if search.isEmpty {
            return nM.recipes
        } else {
            return nM.recipes.filter { $0.name.contains(search) }
        }
    }
    
    var body: some View {
        List {
            ForEach(searchResults) { recipe in
                NavigationLink(destination: {
                    InformationView(recipe: recipe)
                }, label: {
                    HStack {
                        AsyncImage(url: URL(string: recipe.image), content: {$0.resizable()}, placeholder: {})
                            .scaledToFit()
                            .frame(width: 100)
                            .padding()
                        
                        VStack{
                            Text(recipe.name)
                                .padding()
                        }
                    }
                    .foregroundColor(.primary)
                })
            }
        }
        .listStyle(.plain)
        .searchable(text: $search)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(nM: NetworkManager())
    }
}
