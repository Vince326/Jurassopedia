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
        //Decodes/Loads the predator data as soon as the app launches
        decodePredatorData()
    }
    //Takes the predator data from the JSON file and decodes it so it can appear on the app on launch
    func decodePredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                //Converts the json from snakeCase to camelcase
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPreadators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding JSON Data: \(error)")
            }
        }
    }
    //Allows user to search for the predators by name and returns the results filtered by what user types
    func search(for searchTerm: String) -> [ApexPredator] {
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
    //Sorts the dinosaurs in alphabetical order first then by id key, when the sort button is selected
    func sort(by alphabetical: Bool){
        apexPreadators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: PredType) {
        if type == .all{
            
        } else {
            apexPreadators = apexPreadators.filter { predator in
                predator.type == type
            }
        }
    }
}

