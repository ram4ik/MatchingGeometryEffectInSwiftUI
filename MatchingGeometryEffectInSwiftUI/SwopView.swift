//
//  SwopView.swift
//  MatchingGeometryEffectInSwiftUI
//
//  Created by ramil on 22.05.2021.
//

import SwiftUI

struct SwopView: View {
    @Namespace var nameSpace
    @State private var isVertical: Bool = false
    
    var body: some View {
        VStack {
            if isVertical {
                VStack {
                    content
                }
            } else {
                HStack {
                    content
                }
            }
            Button(action: {
                withAnimation {
                    isVertical.toggle()
                }
            }, label: {
                Text("Swop")
                    .padding()
            })
        }
    }
    
    var content: some View {
        Group {
            Rectangle()
                .matchedGeometryEffect(id: "rectangle", in: nameSpace)
            Circle()
                .matchedGeometryEffect(id: "circle", in: nameSpace)
        }
    }
}

struct SwopView_Previews: PreviewProvider {
    static var previews: some View {
        SwopView()
    }
}
