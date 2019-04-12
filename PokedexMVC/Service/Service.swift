//
//  Service.swift
//  PokedexMVC
//
//  Created by mitsuyoshi matsuo on 2019/04/12.
//  Copyright © 2019 mitsuyoshi matsuo. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    func fetchPokemon() {
        
        
        guard let url = URL(string: BASE_URL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // handle error
            if let error = error {
                print("Faled to fetch data with error: ", error.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else { return }
                
                for (key, result) in resultArray.enumerated() {
                    if let dictionary = result as? [String: AnyObject] {
                        let pokemon = Pokemon(id: key, dictionary: dictionary)
                        print(pokemon.name)
                    }
                }
                
            } catch let error {
                print("Faled to fetch data with error: ", error.localizedDescription)
            }
            
        }.resume()
    }
}
