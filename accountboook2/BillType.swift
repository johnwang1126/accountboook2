//
//  BillType.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/24.
//  Copyright © 2020 wtc. All rights reserved.
//

import Foundation
let typedict: [String : String] = [
    //expense
    "购物" : "bag",
    "餐饮" : "heart",
    "交通" : "tram.fill",
    "住房缴费" : "house",
    "学习" : "book",
    "运动" : "sportscourt",
    "娱乐" : "gamecontroller",
    "生活服务" : "leaf.arrow.circlepath",
    "旅游" : "airplane",
    "酒店" : "bed.double",
    "亲子" : "person.3",
    "医疗" : "bandage",
    "服饰美容" : "waveform.path.ecg",
    
    //
    "其他" : "leaf.arrow.circlepath",
    "转账" : "arrow.right.arrow.left",
    "其他人情" : "smiley",
    //income
    
    "生意" : "person.crop.circle.badge.checkmark",
    "退款" : "return",
    "工资" : "creditcard",
    "奖金" : "hand.thumbsup"
    
    
]
let expType = [

    //expense
    "购物" : "bag",
    "餐饮" : "heart",
    "交通" : "tram.fill",
    "住房缴费" : "house",
    "学习" : "book",
    "运动" : "sportscourt",
    "娱乐" : "gamecontroller",
    "生活服务" : "leaf.arrow.circlepath",
    "旅游" : "airplane",
    "酒店" : "bed.double",
    "亲子" : "person.3",
    "医疗" : "bandage",
    "服饰美容" : "waveform.path.ecg",
    
    //
    "其他" : "leaf.arrow.circlepath",
    "转账" : "arrow.right.arrow.left",
    "其他人情" : "smiley"

]

let incType = [

    //
    "其他" : "leaf.arrow.circlepath",
    "转账" : "arrow.right.arrow.left",
    "其他人情" : "smiley",
    //income
    
    "生意" : "person.crop.circle.badge.checkmark",
    "退款" : "return",
    "工资" : "creditcard",
    "奖金" : "hand.thumbsup"
    

]

let expKeys = ["购物", "餐饮", "交通", "住房缴费", "学习",
               "运动", "娱乐", "生活服务", "旅游", "酒店",
               "亲子","医疗", "服饰美容",  "转账", "其他人情","其他",
]
let incKeys = ["生意","退款","工资","奖金","转账","其他人情","其他"
]
