//
//  MotionAnimationVIew.swift
//  Africa
//
//  Created by Amr Muhammad on 05/03/2023.
//

import SwiftUI

struct MotionAnimationVIew: View {
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false

    // Functions
    
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1 ... 2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0.0...2.0)
    }
    
    
    var body: some View {
        GeometryReader {geometry in
            //used to measure screen size and current position and any view we want
            // when view is added inside GeometryReader it's center point changes from center to top Left
            ZStack {
                ForEach(0...randomCircle,id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(),height: randomSize(),alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width)
                            , y: randomCoordinate(max: geometry.size.height)
                    )
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay() )
                        )
                        .onAppear {
                            isAnimating = true
                        }
                }
            }
            .drawingGroup() // use to stop making view render in real time but behave like images so it will not be power consuming
        }
    }
}

struct MotionAnimationVIew_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationVIew()
    }
}
