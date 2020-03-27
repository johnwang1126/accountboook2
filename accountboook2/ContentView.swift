//
//  ContentView.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/24.
//  Copyright © 2020 wtc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Bill.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Bill.date, ascending: false),
        NSSortDescriptor(keyPath: \Bill.amount, ascending: true),
        NSSortDescriptor(keyPath: \Bill.name, ascending: true),
        NSSortDescriptor(keyPath: \Bill.info, ascending: false),
        NSSortDescriptor(keyPath: \Bill.imagename, ascending: false),
    ]) var billItems: FetchedResults<Bill>
    
    @State private var save : Bool = false
    
    func remove(at offsets : IndexSet) {
        for index in offsets {
            let delete = billItems[index]
            self.moc.delete(delete)
        }
        // To remove for the core data
        try? self.moc.save()
    }
    
    
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(billItems, id:\.date){ bill in
                    NavigationLink(destination: EdittingView(bill: bill))
                    {
                        BillRow(name: bill.name ?? "", info: bill.info ?? "", amount: bill.amount, date: bill.date ?? Date(), imagename: bill.imagename ?? "yensign.circle")
                        
                    }
                    
                }.onDelete(perform: remove)
            }.navigationBarTitle("账单")
                .navigationBarItems(
                    trailing: Button(action: { self.save.toggle()}) { Image(systemName: "plus.circle.fill")
                        .font(.system(size: 34))
                })
            .sheet(isPresented: $save) {
                AddNew().environment(\.managedObjectContext, self.moc)
            }
                
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
