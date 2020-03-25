//
//  BillRow.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/24.
//  Copyright © 2020 wtc. All rights reserved.
//

import SwiftUI

struct BillRow: View {
    var name: String
    var info : String
    var amount: Double
    var date: Date
    var imagename: String
    
    var body: some View {
        ZStack{
            Rectangle().fill(Color("rect_fill"))
            .frame(height: 70)
                .cornerRadius(10).shadow(radius: 6)

                
            
            
            HStack {
                Image(systemName: imagename)
                    .padding(.leading)
                    .font(.system(size: 23))
                    .foregroundColor(.green)
                Spacer()
                    .frame(width:14)
                VStack(alignment: .leading) {
                    Text(name)
                    Text(info)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(String(format: "%.2f", amount))
                    .font(.title)
                .padding()
            }
            
        
        }
        
        
        
        
        
        
    }
}

struct BillRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            BillRow(name: "购物", info: "扫描二维码", amount: 5.00, date: Date(), imagename: "cart.fill")
            .environment(\.colorScheme, .light)
            BillRow(name: "购物", info: "扫描二维码", amount: 5.00, date: Date(), imagename: "cart.fill")
            .environment(\.colorScheme, .dark)
        }
        
    }
}
