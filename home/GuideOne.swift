//
//  GuideOne.swift
//  LokerMacet
//
//  Created by Ayu Lestari Ramadani on 03/04/23.
//

import SwiftUI

struct GuideOne: View {
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/14.0/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundColor(.white)
                .frame(width: 350, height: 500)
            VStack{
                Text("Pada Dunia aritmaticus jawab soal-soal menggunakan urutan aritmatika agar mendapat jawaban yang benar")
                    .font(.system(size: 20, design: .rounded)).fontWeight(.medium)
                    .foregroundColor(Color("secondary color"))
                    .padding(.bottom)
                Text("24 + 8 - ( 9 X 3 ) : 9 = …")
                    .font(.system(size: 15, design: .monospaced)).fontWeight(.bold)
                    .foregroundColor(Color("secondary color"))
                Text("Operator yang berwarna menandakan operasi  yang harus dikerjakan pertama kali.")
                    .font(.system(size: 20, design: .rounded)).fontWeight(.medium)
                    .foregroundColor(Color("secondary color"))
                    .padding(.top)
                
            }
            .frame(width: 270, height: 500)
            
        }
    }
}

struct GuideOne_Previews: PreviewProvider {
    static var previews: some View {
        GuideOne()
    }
}
