//
//  ExpandRightMenuButtonView.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-28.
//

import SwiftUI

struct ExpandRightMenuButtonView: View {
    var body: some View {
        Button() {
            print("Expand Right menu")
        } label: {
            ZStack {
                Image("expandMenuButtonHolder")
                    .fixedSize(horizontal: true, vertical: true)
                    .scaleEffect(0.3)
                    .frame(width: 40, height: 40)
                CircleImage(imageName: "dragon")
                    .scaleEffect(0.5)
                    .offset(x: 10)
            }
        }.padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: -5))
    }
}

struct ExpandRightMenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandRightMenuButtonView()
    }
}
