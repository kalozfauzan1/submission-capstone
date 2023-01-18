//
//  CustomEmptyView.swift
//  submission-capstone
//
//  Created by MacbookPro13 on 02/01/23.
//

import SwiftUI

struct CustomEmptyView: View {
  var image: String
  var title: String
  var body: some View {
    VStack {
      Image(image)
        .resizable()
        .renderingMode(.original)
        .scaledToFit()
        .frame(width: 250)
      Text(title)
        .font(.system(.body, design: .rounded))
    }
  }
}
