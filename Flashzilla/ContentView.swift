//
//  ContentView.swift
//  Flashzilla
//
//  Created by Scott Obara on 11/3/21.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
    @State private var scale: CGFloat = 1
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency

    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAnimation {
                    self.scale *= 1.5
                }
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
