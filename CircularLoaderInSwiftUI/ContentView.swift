//
//  ContentView.swift
//  CircularLoaderInSwiftUI
//
//  Created by ramil on 24.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var percent: CGFloat = 0
    
    var body: some View {
        
        VStack {
            Loader(percent: percent)
            HStack {
                Button(action: {
                    self.percent = 80
                }) {
                   Text("80%")
                }
                Button(action: {
                    self.percent = 100
                }) {
                   Text("100%")
                }
                Button(action: {
                    self.percent = 40
                }) {
                   Text("40%")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Loader: View {
    var percent: CGFloat = 0
    var colors: [Color] = [.red, .orange, .yellow, .green, .purple, .red]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .trim(from: 0, to: percent * 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
            ).animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
            Text(String(format: "%.1f", percent) + " %").font(.system(size: 20)).fontWeight(.heavy)
        }
    }
}
