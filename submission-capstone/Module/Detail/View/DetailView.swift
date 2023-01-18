//
//  DetailView.swift
//  submission-capstone
//
//  Created by MacbookPro13 on 02/01/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Core
import Category

struct DetailView: View {
    // swiftlint:disable line_length
    @ObservedObject var presenter: Presenter<String, CategoryModel, Interactor<String, CategoryModel, UpdateFavouriteCategoryRepository<GetFavouriteCategoriesLocaleDataSource, CategoryTransformer>>>
    var category: CategoryModel
    @State var isFavorite: Bool = false
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    imageCategory
                    spacer
                    description
                }.padding()
            }
        }.onAppear {
            self.isFavorite = category.isFavorite
        }.navigationBarTitle(Text(category.title), displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: isFavorite ? "star.fill": "star")
                        .onTapGesture {
                            self.addFavorite()
                        }
                }
            })
    }
}

extension DetailView {
    var spacer: some View {
        Spacer()
    }
    var imageCategory: some View {
        WebImage(url: URL(string: category.image))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: 250.0, height: 250.0, alignment: .center)
    }
    var description: some View {
        Text(category.description)
            .font(.system(size: 15))
    }
    func headerTitle(_ title: String) -> some View {
        return Text(title)
            .font(.headline)
    }
    
    func addFavorite() {
        self.isFavorite = !self.isFavorite
        presenter.execute(request: category.id)
    }
}
