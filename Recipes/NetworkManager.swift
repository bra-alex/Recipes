//
//  NetworkManager.swift
//  Recipes
//
//  Created by Don Bouncy on 11/11/2022.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var recipes = [Recipes]()
    
    func fetchData() {
        if let url = URL(string: "http://localhost:8000/recipes"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode([Recipes].self, from: safeData)
                            DispatchQueue.main.async {
                                self.recipes = results
                                print(self.recipes)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
