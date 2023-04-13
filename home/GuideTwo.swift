//
//  GuideTwo.swift
//  LokerMacet
//
//  Created by Ayu Lestari Ramadani on 03/04/23.
//

import SwiftUI

struct GuideTwo: View {
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/14.0/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .frame(width: 350, height: 500)
            VStack{
                Text("Jika merasa kesulitan, kamu dapat menggunakan hint. ")
                    .font(.system(size: 20, design: .rounded)).fontWeight(.medium)
                    .foregroundColor(Color("secondary color"))
                    .padding(.bottom)
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.white)
                    .background(Circle().padding(-5.0).foregroundColor(Color("secondary color")))
                Text("Hint tersebut akan menampilkan step lanjutan soal itu")
                    .font(.system(size: 20, design: .rounded)).fontWeight(.medium)
                    .foregroundColor(Color("secondary color"))
                    .padding(.vertical)
                Text("24 + 8 - ( 9 X 3 ) : 9 = …")
                    .font(.system(size: 15, design: .monospaced)).fontWeight(.bold)
                    .foregroundColor(Color("secondary color"))
                Text("24 + 8 - 27 : 9 = …")
                    .font(.system(size: 15, design: .monospaced)).fontWeight(.bold)
                    .foregroundColor(Color("secondary color"))
                Text("Penggunaan hint akan mengurangi skor. Batas penggunaan hint saat waktu habis dan hanya tersisa satu operator")
                    .font(.system(size: 20, design: .rounded)).fontWeight(.medium)
                    .foregroundColor(Color("secondary color"))
                    .padding(.vertical)
                Text("32 - 3 = …")
                    .font(.system(size: 15, design: .monospaced)).fontWeight(.bold)
                    .foregroundColor(Color("secondary color"))
            }
            .frame(width: 270, height: 500)
            
        }
    }
}

struct GuideTwo_Previews: PreviewProvider {
    static var previews: some View {
        GuideTwo()
    }
}
