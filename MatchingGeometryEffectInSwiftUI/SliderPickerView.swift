//
//  SliderPickerView.swift
//  MatchingGeometryEffectInSwiftUI
//
//  Created by ramil on 24.05.2021.
//

import SwiftUI

struct SliderPickerView: View {
    @Namespace private var namespace
    let items: [String] = ["fish", "meat", "salade", "dessert"]
    @State private var selectedItem: String = "meat"
    let color = Color(.displayP3, red: 0, green: 0, blue: 1, opacity: 0.5)
    let selectedColor = Color(.displayP3, red: 0, green: 0, blue: 1, opacity: 1)
    
    var body: some View {
        HStack {
            ForEach(items, id: \.self) { item in
                Text(item)
                    .foregroundColor(selectedItem == item ? selectedColor : color)
                    .bold()
                    .padding(.bottom, 2)
                    .background(
                        Color.clear
                            .frame(height: 1)
                            .matchedGeometryEffect(id: item, in: namespace, properties: .frame, isSource: true)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .onTapGesture {
                        withAnimation {
                            selectedItem = item
                        }
                    }
            }
            .background(selectedColor
                            .matchedGeometryEffect(id: selectedItem, in: namespace, properties: .frame, isSource: false)
            )
        }
    }
}

struct SliderPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SliderPickerView()
    }
}
