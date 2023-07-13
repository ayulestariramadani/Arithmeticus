//
//  Review.swift
//  home
//
//  Created by Ayu Lestari Ramadani on 19/04/23.
//

import SwiftUI

struct Review: View {
    @State private var isShowingScreenshot = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 40) {
                Spacer()
                Button(action: {
                    guard let image = captureScreen(),
                          let fileURL = saveScreenshot(image)
                    else {
                        return
                    }
                    self.isShowingScreenshot = true
                    print("Screenshot saved to: \(fileURL)")
                }) {
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing)
                        .frame(width: 45.0, height: 40.0)
                }
            }

            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            TabView {
                Screen1()
                Screen2()
                Screen3()
                
            }
            .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
           
        }.background(Color("ThirdColor"))
    }
    
    func captureScreen() -> UIImage? {
        guard let window = UIApplication.shared.windows.first else {
            return nil
        }
        let renderer = UIGraphicsImageRenderer(bounds: window.bounds)
        return renderer.image { _ in
            window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
        }
    }

    func saveScreenshot(_ image: UIImage) -> URL? {
        guard let data = image.jpegData(compressionQuality: 1.0),
              let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        let fileURL = documentsDirectory.appendingPathComponent("aritmaticusscreenshot.jpg")
        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            print("Error saving screenshot: \(error.localizedDescription)")
            return nil
        }
    }
}

struct Review_Previews: PreviewProvider {
    static var previews: some View {
        Review()
    }
}
