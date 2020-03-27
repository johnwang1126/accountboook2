//
//  BillDetail.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/24.
//  Copyright © 2020 wtc. All rights reserved.
//

import SwiftUI

struct BillDetail: View {
    var name: String
    var info : String
    var amount: Double
    var date: Date
    var imagename: String
    
   
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: imagename)
                    .font(.system(size: 23))
                    .foregroundColor(
                    amount > 0 ?
                        Color.orange : Color.green)
                    Text(name)
                        .font(.system(size: 23))
                }
                Text(String(format: "%.2f",amount))
                    .font(.largeTitle)
            }
            
            Spacer()
                .frame(height:40)
            VStack(alignment: .leading) {
                Text("备注：\(info)")
                    .padding([.leading, .bottom, .trailing])
                Text("日期：\(dateFormatter.string(from: date))")
                    .padding(.horizontal)
            }
           
                
        }
        .offset(x: 0, y: -160)
        
    }
    
    
    
    
}

struct BillDetail_Previews: PreviewProvider {
    static var previews: some View {
        BillDetail(name: "购物", info: "扫描二维码", amount: 5.00, date: Date(), imagename: "cart.fill")
    }
}
