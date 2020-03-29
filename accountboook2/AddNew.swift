//
//  AddNew.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/24.
//  Copyright © 2020 wtc. All rights reserved.
//

import SwiftUI

struct AddNew: View {
    @Environment(\.managedObjectContext) var moc
    
    
    @State private var info : String = ""
    @State private var amount : String = ""
    @State private var date : Date = Date()
    @State private var typeIndex = 0
    @State private var ioe:Int = 0 //0 for expense,1 for income

    var body: some View {
        NavigationView {
            
            Form {
//                select income or expense
                Picker(selection: $ioe, label: Text("")) {
                    Text("支出").tag(0)
                    Text("收入").tag(1)
                }.pickerStyle(SegmentedPickerStyle())

//                input amount and info
                amount_and_info(amount: $amount, info: $info)
                
//                select bill type
                if self.ioe == 1{
                    incPicker(select: $typeIndex)
                }
                else{
                    expPicker(select: $typeIndex)
                }
                
//                select bill date
                DatePicker(selection: $date, displayedComponents: .date){
                    Text("日期")
                }
                    
               
            }
           
            .navigationBarItems(trailing: Button(action: {
                let add = Bill(context: self.moc)
                if self.ioe == 1{
                    add.name = incKeys[self.typeIndex]
                    add.amount = Double(self.amount)!
                }
                else{
                    add.name = expKeys[self.typeIndex]
                    add.amount = -Double(self.amount)!
                }
                
                add.info = self.info
                
                add.imagename = typedict[add.name ?? ""]
                add.date = self.date
                
                try? self.moc.save()
                self.info = ""
                self.amount = ""
                
            }){
                Text("记账")
               .foregroundColor((  self.info.count > 0 && self.amount.count > 0) ?
                    Color.blue :
                    Color.secondary)
            }
            
            .opacity((self.info.count > 0 && self.amount.count > 0) ? 1 : 0.5)
            )
        }
    }
}

struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            
            AddNew()
                .environment(\.colorScheme, .light)
            AddNew()
                    .environment(\.colorScheme, .dark)
        }
        
    }
}

struct amount_and_info: View {
    @Binding var amount: String
    @Binding var info: String
    
    var body: some View {
        VStack{
            TextField("金额...",text: $amount).padding()
                .keyboardType(.decimalPad)
            TextField("备注...",text: $info).padding()
        }
        
    }
}

