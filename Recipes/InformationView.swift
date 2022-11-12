//
//  InformationView.swift
//  Recipes
//
//  Created by Don Bouncy on 11/11/2022.
//

import SwiftUI

struct InformationView: View {
    @State var recipe: Recipes
    
    let columns = [GridItem(.adaptive(minimum: 50))]
    //    let ingredients: [Recipes.Ingredients] = [
    //        Recipes.Ingredients(
    //            id: "636ec93b698804f2a76f571a",
    //            title: "Patties",
    //            ingredients: [
    //                "1 pound ground turkey",
    //                "⅓ cup red onion, minced",
    //                "1 jalapeño pepper, minced",
    //                "1 teaspoon salt",
    //                "½ teaspoon black pepper",
    //                "1 teaspoon cayenne pepper",
    //                "1½ teaspoons cumin",
    //                "1 teaspoon smoked paprika",
    //                "2 tablespoons vegetable oil (for cooking)"
    //            ]
    //        ),
    //        Recipes.Ingredients(
    //            id: "636ec93b698804f2a76f571c",
    //            title: "Patties",
    //            ingredients: [
    //                "Sesame seed bun",
    //                "Shredded lettuce",
    //                "Sliced tomato",
    //                "Pepper Jack cheese",
    //                "Avocado"
    //
    //            ]
    //        ),
    //        Recipes.Ingredients(
    //            id: "636ec93b698804f2a76f571b",
    //            title: "Patties",
    //            ingredients: [
    //                "½ cup mayonnaise",
    //                "2 tablespoons canned chilies in adobo",
    //                "½ lime, juiced"
    //            ]
    //        )
    //    ]
    
    var body: some View {
        GeometryReader{ proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: recipe.image), content: {$0.resizable()}, placeholder: {})
                        .scaledToFit()
                        .frame(width: proxy.size.width * 0.9)
                    
                    Text("Ingredients")
                        .font(.title2.bold())
                        .padding(.vertical)
                    
                    ScrollView(.horizontal){
                        LazyHGrid(rows: columns, alignment: .top) {
                            HStack(alignment: .top) {
                                ForEach(recipe.ingredients){ ingredient in
                                    VStack(alignment: .leading) {
                                        if ingredient.title != "Ingredients"{
                                            Text(ingredient.title)
                                                .font(.headline)
                                        }
                                        
                                        ForEach(ingredient.ingredients, id: \.self) {
                                            Text($0)
                                                .font(.caption)
                                                .padding(.top, 3)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Instructions")
                            .font(.title3.bold())
                            .padding(.vertical)
                        
                        ForEach(recipe.instructions, id: \.self) {
                            Text($0)
                                .font(.subheadline)
                                .padding(.top, 3)
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(recipe: NetworkManager().recipes[0])
    }
}

