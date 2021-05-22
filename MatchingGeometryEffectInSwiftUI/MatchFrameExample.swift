//
//  MatchFrameExample.swift
//  MatchingGeometryEffectInSwiftUI
//
//  Created by ramil on 22.05.2021.
//

import SwiftUI

struct MatchFrameExample: View {
    @Namespace private var nameSpace
    @State private var isMatched: Bool = false
    let geometryID: String = "geometryID"
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .border(Color.orange)
                .matchedGeometryEffect(id: geometryID, in: nameSpace, properties: .frame, anchor: .center, isSource: isMatched)
                .zIndex(1)
            Button(action: {
                withAnimation {
                    isMatched.toggle()
                }
            }, label: {
                Text("Switch")
            })
            Rectangle()
                .fill(Color.red)
                .matchedGeometryEffect(id: geometryID, in: nameSpace, properties: .frame, anchor: .center, isSource: false)
                .zIndex(0)
        }
    }
}

struct MatchFrameExample_Previews: PreviewProvider {
    static var previews: some View {
        MatchFrameExample()
    }
}
