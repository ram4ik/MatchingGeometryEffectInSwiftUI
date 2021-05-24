//
//  CirclePickerView.swift
//  MatchingGeometryEffectInSwiftUI
//
//  Created by ramil on 24.05.2021.
//

import SwiftUI

struct CirclePickerView: View {
    var items: [String] = ["first", "second", "third"]
    let size: CGFloat = 15
    @Namespace private var namespace
    @State private var selection: String = "first"
    
    var body: some View {
        VStack {
            ForEach(items, id:\.self) { item in
                HStack {
                    Circle()
                        .stroke(item == selection ? Color.accentColor : Color.gray)
                        .frame(width: size, height: size)
                        .matchedGeometryEffect(id: item, in: namespace, properties: .frame, isSource: true)
                    Text(item)
                }.onTapGesture {
                    withAnimation {
                        selection = item
                    }
                }
            }
            Circle()
                .fill(Color.accentColor)
                .matchedGeometryEffect(id: selection, in: namespace, properties: .frame, isSource: false)
                .frame(width: 20, height: 20)
        }
    }
}

struct CirclePickerView_Previews: PreviewProvider {
    static var previews: some View {
        CirclePickerView()
    }
}
