//
//  CategoryRow.swift
//  submission-capstone
//
//  Created by MacbookPro13 on 02/01/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Category

struct CategoryRow: View {

  var category: CategoryModel
  var body: some View {
    VStack {
      imageCategory
      content
    }
    .frame(width: UIScreen.main.bounds.width - 32, height: 250)
    .background(Color.random.opacity(0.3))
    .cornerRadius(30)
  }

}

extension CategoryRow {

  var imageCategory: some View {
    WebImage(url: URL(string: category.image))
      .resizable()
      .indicator(.activity)
      .transition(.fade(duration: 0.5))
      .scaledToFit()
      .frame(width: 200)
      .cornerRadius(30)
      .padding(.top)
  }
  var content: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(category.title)
        .font(.title)
        .bold()
      Text(category.description)
        .font(.system(size: 14))
        .lineLimit(2)
    }.padding(
      EdgeInsets(
        top: 0,
        leading: 16,
        bottom: 16,
        trailing: 16
      )
    )
  }

}
