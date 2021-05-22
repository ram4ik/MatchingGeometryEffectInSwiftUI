//
//  AdaptiveView.swift
//  MatchingGeometryEffectInSwiftUI
//
//  Created by ramil on 22.05.2021.
//

import SwiftUI

struct AdaptiveView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass : UserInterfaceSizeClass?
    @Namespace var nameSpace
    
    var body: some View {
        GeometryReader { geometry in
            ConditionalStack(vAlignment: .center, hAlignment: .center, vSpacing: 10, hSpacing: 10, isVStack: verticalSizeClass == .regular) {
                VStack(alignment: .leading) {
                    HStack {
                        Image("c1")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100, alignment: .center)
                        Text("British Cat")
                    }.matchedGeometryEffect(id: "image", in: nameSpace)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam maximus gravida ex. Aliquam lobortis leo in lorem dictum, eleifend vestibulum nulla iaculis. Quisque arcu sem, ornare vel fermentum consectetur, hendrerit vel nisl. Sed ac ultricies diam. Proin eu ante ex. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean quis porta ex. Maecenas varius interdum felis et suscipit. Cras nisi lectus, volutpat ut massa in, placerat pellentesque justo. Morbi erat felis, condimentum a leo vitae, convallis tempus ex. Sed mollis aliquet lectus, eu efficitur ex congue non. Ut eros mi, sagittis volutpat elementum et, finibus ut mi. Nullam non diam vitae elit sodales feugiat ac vel diam. Aliquam aliquet neque quis dolor dictum, non gravida neque pellentesque. Nulla vitae efficitur lectus, vitae iaculis velit.")
                        .font(.footnote)
                }
                .matchedGeometryEffect(id: "text", in: nameSpace)
                Image("c2")
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "largeImage", in: nameSpace)
            }.padding()
        }.animation(.spring())
    }
}

struct AdaptiveView_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveView()
    }
}
