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
     
    @State var ioe = false //true for income, false for expense
    @State var edit = false
    
    var body: some View {
        
       
            
            ZStack{
                BillDetail(name: bill.name ?? "", info: bill.info ?? "", amount: bill.amount, date: bill.date ?? Date(), imagename: bill.imagename ?? "yensign.circle")
                .blur(radius: self.edit ? 10 : 0)
                .animation(.spring())
                
                Button(action:{
                    self.edit = true
                }){
                    Text("编辑")
                }
                .blur(radius: self.edit ? 10 : 0)
                
                
                
                VStack{
                    Toggle(self.ioe ? "收入" : "支出", isOn: self.$ioe)
                    
                    TextField("金额: \(String(self.bill.amount))",text: $amount).padding()
                                   .keyboardType(.decimalPad)
                    TextField("备注： \(String(self.bill.info ?? ""))",text: $info).padding()
                    
                    if self.ioe{
                        incPicker(select: $typeIndex)
                    }
                    else{
                        expPicker(select: $typeIndex)
                    }
                    
                    
                    Button(action: {
                        
                        if self.ioe{
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
/*
struct EdittingView_Previews: PreviewProvider {
    static var previews: some View {
        EdittingView(bill: Bill())
    }
}*/

