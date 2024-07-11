//
//  ExpandTopMenuBar.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-28.
//

import SwiftUI

struct ExpandTopMenuBar: View {
    @State var isExpanded = false
    var body: some View {
        Button() {
            print("Expand down menu")
            isExpanded.toggle()
        } label: {
            ZStack {
                if isExpanded {
                    Image("expandDownMenuBar")
                        .fixedSize(horizontal: true, vertical: true)
                        .scaleEffect(0.5)
                        .frame(width: 40, height: 40)
                } else {
                    Image("hideUpMenuBar")
                        .fixedSize(horizontal: true, vertical: true)
                        .scaleEffect(0.5)
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
}

struct ExpandTopMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        ExpandTopMenuBar()
    }
}
