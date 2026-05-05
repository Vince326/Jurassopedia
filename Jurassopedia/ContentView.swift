//
//  ContentView.swift
//  Jurassopedia
//
//  Created by Vincent Hunter on 4/28/26.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    
    @State var searchText = ""
    @State var alphabetical = false
    @State var currentSelection = PredType.all
    
    //Returns the filtered dinos of type ApexPredator collection in the searchtext state variable; calls the search function in the search textbox
    var filteredDinos: [ApexPredator] {
        predators.filter(by: currentSelection)
        
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredDinos) { predator in
                NavigationLink {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                } label: {
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
                
            }
            //Sets the navigation title, the search text and search bar placement, autocorection setting and animation when user types dino name
            .navigationTitle(Text("Jurassopedia"))
            .searchable(text: $searchText,placement: .navigationBarDrawer)
            .autocorrectionDisabled(true)
            .animation(.default, value:searchText)
            .toolbar {
                ToolbarItem(placement:.topBarLeading){
                    Button {
                        withAnimation{
                            alphabetical.toggle()
                        }
                    } label: {
                        
                        Image(systemName: alphabetical ? "textformat" : "film")
                            .symbolEffect(.bounce, value:alphabetical)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentSelection) {
                            ForEach(PredType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        //Sets the color scheme to dark by default
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
