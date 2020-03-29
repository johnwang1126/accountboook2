//
//  Budget.swift
//  accountboook2
//
//  Created by 王天诚 on 2020/3/29.
//  Copyright © 2020 wtc. All rights reserved.
//

import SwiftUI

struct Budget: View {
   //get the income of current month
   @FetchRequest(entity: Bill.entity(), sortDescriptors: [
       NSSortDescriptor(keyPath: \Bill.date, ascending: false)
   ],
                 predicate: NSPredicate(format: "date > %@ AND amount < %f", Date().startOfMonth() as NSDate, 0)
   ) var expenseBills: FetchedResults<Bill>
  
    var sumMonth: Double {
        -expenseBills.reduce(0) { $0 + $1.amount}
    }
    
    @State var budget:Double = 2000
    @State var percentage:Double = 0
    var body: some View {
        ZStack{
            Color("budget_background")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                ZStack{
                           Pulsation()
                           Track()
                           Label(percentage: percentage)
                           Outline(percentage: percentage)
                       }
                Spacer()
                VStack {
                    HStack{
                        Text("月预算：\(Int(budget))")
                            .foregroundColor(.secondary)
                            .padding(.trailing)
                        
                        Button(action: {
                            self.percentage = (self.sumMonth/self.budget) * 100
                            
                        })
                        {
                            Text("确认")
                        }
                        .padding(.leading)
                    }
                    HStack{
                        
                        Slider(value: $budget, in: 2000...20000, step: 100)
                        
                    }
                    .padding(.all)
                    
                  
                    
                }
                
                       
                       
                }

        }
       
        
    }
}

struct Label: View {
    var percentage : Double = 0
    var body: some View{
        ZStack{
            Text("\(Int(percentage))%").font(.system(size: 65)).fontWeight(.heavy)
        }
    }
    
}

struct Outline: View {
    var percentage : Double = 0
    var colors: [Color] = [Color(red: 54.0/255.0, green: 255.0/255.0, blue: 203.0/255.0)]
    var body: some View{
        ZStack{
            Circle()
                .fill(Color.clear)
                .frame(width: 250, height: 250)
            .overlay(
             Circle()
                .trim(from: 0, to: CGFloat(percentage * 0.01))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round ))
                .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero ,endAngle: .init(degrees: 360)))
            ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
        
    }
}

struct Track: View {
    var colors: [Color] = [Color(red: 45.0/255.0, green: 56.0/255.0, blue: 95.0/255.0)]
    var body: some View{
        ZStack{
            Circle()
                .fill(Color("budget_background"))
                .frame(width: 250, height: 250)
            .overlay(
                Circle()
                .stroke(style: StrokeStyle(lineWidth: 20))
                .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
            )
        }
    }
}

struct Pulsation : View {
    @State private var pulsate = false
    var colors: [Color] = [Color(red: 73.0/255.0, green: 113.0/255.0, blue: 148.0/255.0)]
    var body: some View{
        ZStack{
            Circle()
                .fill(Color(red: 73.0/255.0, green: 113.0/255.0, blue: 148.0/255.0))
                .frame(width: 245, height: 245)
                .scaleEffect(pulsate ? 1.3 : 1.1)
                .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
                .onAppear{
                    self.pulsate.toggle()
            }
        }
        
    }
}

struct Budget_Previews: PreviewProvider {
    static var previews: some View {
        Budget()
    }
}
