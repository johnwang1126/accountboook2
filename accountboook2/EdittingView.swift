//
//  EdittingView.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/26.
//  Copyright © 2020 wtc. All rights reserved.
//

import SwiftUI

struct EdittingView: View {
    @Environment(\.managedObjectContext) var moc
    
    var bill:Bill
    
    @State private var info : String = ""
    @State private var amount : String = ""
    @State private var date : Date = Date()
    
     
    @State private var typeIndex = 0
    @State private var ioe:Int = 0 //0 for expense,1 for income
    @State var edit = false
    
    var body: some View {
          ZStack{
//            show bill detail by default
                BillDetail(name: bill.name ?? "", info: bill.info ?? "", amount: bill.amount, date: bill.date ?? Date(), imagename: bill.imagename ?? "yensign.circle")
                .blur(radius: self.edit ? 10 : 0)
                .animation(.spring())
//                editting button
                Button(action:{
                    self.edit = true
                }){
                    Text("编辑")
                }
                .blur(radius: self.edit ? 10 : 0)
                
//                editting view that are similiar to that of adding
                
                VStack{
                    Picker(selection: $ioe, label: Text("")) {
                        Text("支出").tag(0)
                        Text("收入").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    TextField("金额: \(String(self.bill.amount))",text: $amount).padding()
                                   .keyboardType(.decimalPad)
                    TextField("备注: \(String(self.bill.info ?? ""))",text: $info).padding()
                    
                    if self.ioe == 1{
                        incPicker(select: $typeIndex)
                    }
                    else{
                        expPicker(select: $typeIndex)
                    }
                    DatePicker(selection: $date, displayedComponents: .date){
                        Text("日期")
                    }
                    
                    Button(action: {
                        
                        if self.ioe == 1{
                            self.bill.name = incKeys[self.typeIndex]
                            if (self.amount.count > 0){
                                self.bill.amount = Double(self.amount)!
                            }
                            
                        }
                        else{
                            self.bill.name = expKeys[self.typeIndex]
                            if (self.amount.count > 0){
                                self.bill.amount = -Double(self.amount)!
                            }
                        }
                        if (self.info.count > 0){
                            self.bill.info = self.info
                        }
                        
                        self.bill.imagename = typedict[self.bill.name ?? ""]
                        self.bill.date = self.date
                        
                        try? self.moc.save()
                        self.info = ""
                        self.amount = ""
                        
                    }){
                        Text("确认")
                    }
                }
                .offset(x: 0, y: self.edit ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
            .padding()
                
                
            }
       
        }
}
