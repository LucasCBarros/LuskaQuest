//
//  ExpandBottomMenuBar.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-28.
//

import SwiftUI

struct ExpandBottomMenuBar: View {
    @State var isExpanded = false
    
    var body: some View {
        Button() {
            print("Expand down menu")
            isExpanded.toggle()
        } label: {
            ZStack {
                if isExpanded {
                    Image("expandUpMenuBar")
                        .fixedSize(horizontal: true, vertical: true)
                        .scaleEffect(0.5)
                        .frame(width: 40, height: 40)
                } else {
                    Image("hideDownMenuBar")
                        .fixedSize(horizontal: true, vertical: true)
                        .scaleEffect(0.5)
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
}

struct ExpandBottomMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        ExpandBottomMenuBar()
    }
}
