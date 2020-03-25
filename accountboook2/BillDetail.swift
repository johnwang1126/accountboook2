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
                       
                    Text(name)
                }
                Text(String(format: "%.2f",amount))
                    .font(.largeTitle)
            }
            
            Spacer()
                .frame(height:40)
            Text("备注：\(info)")
                .padding()
            Text("创建日期：\(date)")
                .padding(.horizontal)
        }
        .offset(x: 0, y: -160)
    }
    
    
    
    
}

struct BillDetail_Previews: PreviewProvider {
    static var previews: some View {
        BillDetail(name: "购物", info: "扫描二维码", amount: 5.00, date: Date(), imagename: "cart.fill")
    }
}
