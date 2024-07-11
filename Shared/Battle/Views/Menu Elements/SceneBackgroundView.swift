//
//  SceneBackgroundView.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-28.
//

import SwiftUI

struct SceneBackgroundView: View {
    var body: some View {
        Image("background_Beta")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct SceneBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        SceneBackgroundView()
            .previewDevice("iPhone 8")
    }
}


