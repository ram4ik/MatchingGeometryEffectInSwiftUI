//
//  ConditionalStack.swift
//  MatchingGeometryEffectInSwiftUI
//
//  Created by ramil on 22.05.2021.
//

import SwiftUI

struct ConditionalStack<Content>: View where Content: View {
    var content: () -> Content
    let hSpacing: CGFloat
    let vSpacing: CGFloat
    let vAlignment: HorizontalAlignment
    let hAlignment: VerticalAlignment
    let isVStack: Bool
    
    init(vAlignment: HorizontalAlignment = .center,
         hAlignment: VerticalAlignment = .center,
         vSpacing: CGFloat = 0,
         hSpacing: CGFloat = 0,
         isVStack: Bool,
         @ViewBuilder content: @escaping () -> Content) {
        
        self.content = content
        self.vAlignment = vAlignment
        self.hAlignment = hAlignment
        self.hSpacing = hSpacing
        self.vSpacing = vSpacing
        self.isVStack = isVStack
    }
    var body: some View {
        Group {
            if isVStack {
                VStack(alignment: vAlignment, spacing: vSpacing) {
                    content()
                }
            } else {
                HStack(alignment: hAlignment, spacing: hSpacing) {
                    content()
                }
            }
        }
    }
}
