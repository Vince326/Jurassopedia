//
//  Predators.swift
//  Jurassopedia
//
//  Created by Vincent Hunter on 4/28/26.
//

import Foundation

class Predators {
    var apexPreadators : [ApexPredator] = []
    
    func decodePredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPreadators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding JSON Data: \(error)")
            }
        }
    }
}

