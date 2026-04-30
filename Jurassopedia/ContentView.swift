//
//  ContentView.swift
//  Jurassopedia
//
//  Created by Vincent Hunter on 4/28/26.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    
    var body: some View {
        List(predators.apexPreadators) { predator in
            HStack {
                //Dinosaur Image
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:100, height:100)
                    .shadow(color:.white, radius: 1.0)
                VStack(alignment: .leading){
                    //Dinosaur Name
                    Text(predator.name)
                        .fontWeight(.bold)
                    
                    
                    //Dinosaur Type
                    Text(predator.type.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(predator.type.background)
                        .clipShape(.capsule)
                        
                }
            }
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
