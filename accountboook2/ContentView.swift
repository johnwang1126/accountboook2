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
    
    //get the income of current month
    @FetchRequest(entity: Bill.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Bill.date, ascending: false)
    ],
                  predicate: NSPredicate(format: "date > %@ AND amount > %f", Date().startOfMonth() as NSDate, 0)
    ) var incomeBills: FetchedResults<Bill>
    var incomeSum: Double {
        incomeBills.reduce(0) { $0 + $1.amount}
    }
    
    //get the expense of current month
    @FetchRequest(entity: Bill.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Bill.date, ascending: false)
    ],
                  predicate: NSPredicate(format: "date > %@ AND amount < %f", Date().startOfMonth() as NSDate, 0)
    ) var expenseBills: FetchedResults<Bill>
    var expenseSum: Double {
        expenseBills.reduce(0) { $0 + $1.amount}
    }
    
    
    func remove(at offsets : IndexSet) {
        for index in offsets {
            let delete = billItems[index]
            self.moc.delete(delete)
        }
        // To remove for the core data
        try? self.moc.save()
    }
  
    @State private var save : Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack {
//                total income, total expense and budget
                HStack{
                    HStack{
                        Text("本月收入：").foregroundColor(.secondary)
                            .font(.subheadline)
                        Text(String(format: "%.0f", incomeSum))
                            .foregroundColor(.orange)
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("本月支出：").foregroundColor(.secondary)
                            .font(.subheadline)
                        Text(String(format: "%.0f", expenseSum))
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal)
                    NavigationLink(destination: Budget()) {
                               Text("预算")
                            }
                    .padding(.horizontal)
                }
//                list of all bills
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
