//
//  InstanceListView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct InstanceListView: View {
    @Environment(\.managedObjectContext) var context
    let symptom: Symptom
    
    var body: some View {
        VStack {
            InstanceCellHeader()
            
            List {
                ForEach(symptom.instanceArray, id: \.self) { instance in
                    HStack {
                        InstanceCell(instance: instance)
                        //                    Text(instance.stringDateTime)
                        //                    Text(instance.wrappedSeverity)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Instances")
            .navigationBarItems(trailing:
                NavigationLink(destination: AddInstanceView(symptom: symptom) ) {
                    Text("Add")
                }
            )
        }
    }
    
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            //            let instance = ins[index]
            let instance = symptom.instanceArray[index]
            context.delete(instance)
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

