//
//  Screen2.swift
//  ReviewScreen
//
//  Created by Khairunnisa Nurrahmatia Salsabila on 15/04/23.
//

import SwiftUI

struct Screen2: View {
    var body: some View {
        let numberHint = 3
        let myScore = 171
        
        VStack(){
            VStack {
                
                Spacer()
                Image(systemName: "snowflake")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                VStack(spacing: 25){
                    Text("Ini adalah \n rapor pencapaian kamu!")
                        .font(.title)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    
                }
                Spacer()
                Spacer()
                
                VStack(spacing: 20) {
                    
                    Text("Jumlah hint terpakai------------ \(numberHint)").fontWeight(.medium).font(.title3)
                    Text("Skor --------------------------  \(myScore)").fontWeight(.medium).font(.title3)
                }   .background(Image(systemName: "viewfinder")
                    .resizable()
                    .frame(width: 390, height: 390))
                
                Spacer()
                Spacer()
            }
            Spacer()
            Spacer()
        }
    }
    
    struct Screen2_Previews: PreviewProvider {
        static var previews: some View {
            Screen2()
        }
    }
}
