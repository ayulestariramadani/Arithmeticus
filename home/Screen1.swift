//
//  Screen1.swift
//  ReviewScreen
//
//  Created by Khairunnisa Nurrahmatia Salsabila on 14/04/23.
//

import SwiftUI

struct Screen1: View {

    var body: some View {
        

        VStack (spacing: 40){
                    Spacer()
                    Spacer()
                    VStack {
                        Image(systemName: "staroflife")
                            .resizable()
                            .frame(width: 100.0, height: 100.0)
                        
                        Text("Selamat!")
                            .font(.system(size:30, design: .rounded))
                            .padding()
                            .fontWeight(.heavy)
                        
                    }
                    Spacer()
                    VStack{
                        Text("Kamu membuktikan ke \n alien Aritmatikus \n bahwa manusia Bumi pintar!  ")

                            .font(.system(size: 26, design: .rounded))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)

                            
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                }

    }
}

struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        Screen1()
    }
}
