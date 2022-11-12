//
//  GridView.swift
//  Recipes
//
//  Created by Don Bouncy on 11/11/2022.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var nM: NetworkManager
    @State private var search = ""
    
    let columns = [GridItem(.adaptive(minimum: 170))]
    
    var searchResults: [Recipes] {
        if search.isEmpty {
            return nM.recipes
        } else {
            return nM.recipes.filter { $0.name.contains(search) }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(searchResults) { recipe in
                    
                    NavigationLink(destination: {
                        InformationView(recipe: recipe)
                    }, label: {
                        VStack {
                            AsyncImage(url: URL(string: recipe.image), content: {$0.resizable()}, placeholder: {})
                                .scaledToFill()
                                .frame(width: 175, height: 130)
                            
                            VStack{
                                Text(recipe.name)
                                    .padding(.vertical)
                            }
                            .frame(maxWidth: .infinity)
                            .background(.gray)
                        }
                        .foregroundColor(.primary)
                    })
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .overlay {
                        RoundedRectangle(cornerRadius: 25).stroke()
                    }
                    .frame(height: 300)
                }
            }.padding(.horizontal)
        }
        .searchable(text: $search)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(nM: NetworkManager())
            .onAppear(perform: NetworkManager().fetchData)
    }
}
