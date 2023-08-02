//
//  CustomCurveBootCamp.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 02.08.23.
//

import SwiftUI

struct CustomCurveBootCamp: View {
    var body: some View {
        ArcSample()
            .frame(width: 200, height: 200)
    }
}

struct CustomCurveBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomCurveBootCamp()
    }
}

struct ArcSample : Shape {
    func path(in rect: CGRect) -> Path {
        Path {path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 20),
                clockwise: true)
            
        }
    }
}
