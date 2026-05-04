//
//  Predators.swift
//  Jurassopedia
//
//  Created by Vincent Hunter on 4/28/26.
//

import Foundation

class Predators {
    var apexPreadators : [ApexPredator] = []
    
    init() {
        decodePredatorData()
    }
    
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
    
    func searc(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            return apexPreadators
        } else {
            return apexPreadators.filter {
                predator in
                predator.name
                    .localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabetical: Bool){
        apexPreadators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
}

