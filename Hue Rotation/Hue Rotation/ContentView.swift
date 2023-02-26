//
//  ContentView.swift
//  Hue Rotation
//
//  Created by Aashish Bansal on 26/02/23.
//

import SwiftUI

struct ContentView: View {
    
    // Adding the Animation Properties
    @State private var shiftColors = false
    
    // Propertry to track the Images dropped into the Asset Catalog
    @State private var image = "dog"
    
    // Adding the background Property
    let backgroundColor = Color(.black)
    
    var body: some View {
        VStack {
            ZStack{
                // Setting the Background Color
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                    .scaleEffect(1.4)
                
                // Adding the Image
                Image(image)
                    .resizable()
                    .padding(20)
                    .frame(width: 350, height: 350)
                    .hueRotation(.degrees(shiftColors ? 360*2:0)) // Animating the Colors in the Image using Hue Rotation
                    .animation(Animation.easeInOut(duration: 2).delay(0.4).repeatForever(autoreverses: true)) // Adding the Animation on this
                    .onAppear(){ // starting things
                        shiftColors.toggle()
                    }
            }
            // Calling the ImagePicker with the selected Image
            ImagePicker(selectedImage: $image)
            .frame(width: 350, height: 200)
        }.background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
    }
}

// Image Picker struct to pick images from the Asset Catalog
struct ImagePicker: View{
    // Binding to the ContentView
    @Binding var selectedImage: String
    
    // Adding the Array of Images
    let images: [String] = ["ornament","landscape","dog","dice","cat"]
    
    var body: some View{
        // Adding a Picker that is wheel style
        Picker("", selection: $selectedImage){
            // Looping over the Images
            ForEach(images, id: \.self){ value in
                Text(value)
                    .foregroundColor(.white)
            }.pickerStyle(RadioGroupPickerStyle()) // Setting the Picker style to wheel
                .frame(width: 300, height: 150)
                .background(Color.red.colorMultiply(.blue))
                .cornerRadius(20)
                .shadow(color: .white, radius: 5, x: 0, y: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
