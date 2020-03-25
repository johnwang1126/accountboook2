//
//  PIcker.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/25.
//  Copyright © 2020 wtc. All rights reserved.
//

import SwiftUI
struct expPicker: View {
    @Binding var select: Int
    var body: some View {
        Picker(selection: $select, label: Text("类型")) {
            ForEach(0 ..< expKeys.count){
                Text(
                    expKeys[$0]
                ).tag($0)
            }
        }
    }
}
struct incPicker: View {
    @Binding var select: Int
    var body: some View {
        Picker(selection: $select, label: Text("类型")) {
            ForEach(0 ..< incKeys.count){
                Text(
                    incKeys[$0]
                ).tag($0)
            }
        }
    }
}

