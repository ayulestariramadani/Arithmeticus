//
//  Screen3.swift
//  ReviewScreen
//
//  Created by Khairunnisa Nurrahmatia Salsabila on 15/04/23.
//

import SwiftUI

struct Screen3: View {
    var body: some View {
        VStack(spacing: 25){
            Spacer()
            VStack {
                Image(systemName: "moon.stars.fill")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
            }
               VStack {
                   
                    Text("Kamu sudah mengerti urutan aritmatika dasar, \nmulai dari\n pertambahan (+) \npengurangan(-) \nperkalian(x) \ndan pembagian(/) \n\n\n\nTetap semangat ya! \n\n\n")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .fontWeight(.medium)
                }
            Spacer()
            Spacer()
            }
            
        }    
}

struct Screen3_Previews: PreviewProvider {
    static var previews: some View {
        Screen3()
    }
}
