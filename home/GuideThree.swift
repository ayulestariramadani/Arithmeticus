//
//  GuideThree.swift
//  LokerMacet
//
//  Created by Ayu Lestari Ramadani on 03/04/23.
//

import SwiftUI

struct GuideThree: View {
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/14.0/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .frame(width: 350, height: 500)
            VStack{
                Text("Terdapat 3 lives yang kamu punya selama di planet aritmaticus.")
                    .font(.system(size: 20, design: .rounded)).fontWeight(.medium)
                    .foregroundColor(Color("secondary color"))
                    .padding(.bottom)
                HStack {
                    ForEach(0...2, id: \.self){_ in
                        Image(systemName: "bolt.fill")
                    }
                    .foregroundColor(Color("complementary color"))
        
                }
                Text("Lives ini akan berkurang jika kamu kehabisan waktu atau memberi jawaban yang salah")
                    .font(.system(size: 20, design: .rounded)).fontWeight(.medium)
                    .foregroundColor(Color("secondary color"))
                    .padding(.top)
                
            }
            .frame(width: 270, height: 500)
            
        }
    }
}

struct GuideThree_Previews: PreviewProvider {
    static var previews: some View {
        GuideThree()
    }
}
