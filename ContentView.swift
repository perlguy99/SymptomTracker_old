//
//  ContentView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Symptom.entity(), sortDescriptors: []) var symptoms: FetchedResults<Symptom>
    
    @State private var showingAddSymptomView = false
    
    
    var body: some View {
        NavigationView {
            
            SymptomView()
                .navigationBarTitle("Symptoms")
                .navigationBarItems(trailing:
                    NavigationLink(destination: AddSymptomView(context: self.context)) {
                        Text("Add")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
