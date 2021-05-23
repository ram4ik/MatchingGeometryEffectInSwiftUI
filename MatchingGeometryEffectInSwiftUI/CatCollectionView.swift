//
//  CatCollectionView.swift
//  MatchingGeometryEffectInSwiftUI
//
//  Created by ramil on 23.05.2021.
//

import SwiftUI

struct CatCollectionView: View {
    let cats: [String] = ["c1", "c2", "c3", "c4", "c5"]
    @State private var selectedCat: String? = nil
    @State private var topMostCat: String? = nil
    @Namespace var nameSpace
    
    var body: some View {
        ZStack {
            VStack {
                Text("Meet the cats")
                    .font(.title)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        ForEach(cats, id: \.self) { cat in
                            Image(cat)
                                .resizable()
                                .scaledToFill()
                                .animation(nil)
                                .matchedGeometryEffect(id: cat, in: nameSpace, properties: .frame, anchor: .center, isSource: cat != selectedCat)
                                .frame(maxWidth: 160, maxHeight: 160)
                                .cornerRadius(20)
                                .onTapGesture {
                                    topMostCat = cat
                                    withAnimation {
                                        selectedCat = cat
                                    }
                                }
                                .zIndex(cat == topMostCat ? 1 : 0)
                        }
                    }.padding()
                }.frame(maxHeight: 200)
                Spacer()
            }.blur(radius: selectedCat != nil ? 6 : 0)
            
            if selectedCat != nil {
                CatView(nameSpace: nameSpace, selectedCat: $selectedCat)
                    .zIndex(2)
            }
        }
    }
}

struct CatCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CatCollectionView()
    }
}

struct CatView: View {
    let nameSpace: Namespace.ID
    @Binding var selectedCat: String?
    let cornerRadius: CGFloat = 20
    
    var body: some View {
        if selectedCat != nil {
            VStack {
                Image(selectedCat!)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 20)
                    .animation(nil)
                    .transition(.asymmetric(insertion: .identity, removal: .opacity))
                    .matchedGeometryEffect(id: selectedCat!, in: nameSpace, properties: .frame, anchor: .center, isSource: selectedCat != nil)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam maximus gravida ex. Aliquam lobortis leo in lorem dictum, eleifend vestibulum nulla iaculis. Quisque arcu sem, ornare vel fermentum consectetur, hendrerit vel nisl. Sed ac ultricies diam. Proin eu ante ex. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean quis porta ex. Maecenas varius interdum felis et suscipit. Cras nisi lectus, volutpat ut massa in, placerat pellentesque justo. Morbi erat felis, condimentum a leo vitae, convallis tempus ex. Sed mollis aliquet lectus, eu efficitur ex congue non. Ut eros mi, sagittis volutpat elementum et, finibus ut mi. Nullam non diam vitae elit sodales feugiat ac vel diam. Aliquam aliquet neque quis dolor dictum, non gravida neque pellentesque. Nulla vitae efficitur lectus, vitae iaculis velit.")
                    .font(.footnote)
                    .padding()
            }
            .shadow(radius: 20)
            .cornerRadius(20)
            .background(Color(.systemBackground)
                            .cornerRadius(20)
                            .shadow(radius: 20))
            .padding()
            .onTapGesture {
                withAnimation {
                    selectedCat = nil
                }
            }
        } else {
            EmptyView()
        }
    }
}
