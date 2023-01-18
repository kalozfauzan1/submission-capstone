//
//  FavouriteView.swift
//  submission-capstone
//
//  Created by MacbookPro13 on 02/01/23.
//

import SwiftUI
import Core
import Category

struct FavouriteView: View {
    // swiftlint:disable line_length
    @EnvironmentObject var presenter: GetListPresenter<Any, CategoryModel, Interactor<Any, [CategoryModel], GetFavouriteCategoriesRepository<GetFavouriteCategoriesLocaleDataSource, GetCategoriesRemoteDataSource, CategoriesTransformer>>>
    var body: some View {
        ZStack {
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else if presenter.list.isEmpty {
                emptyCategories
            } else {
                content
            }
        }.onAppear {
            self.presenter.getList(request: nil)
        }.navigationBarTitle(
            Text("Meals Apps"),
            displayMode: .automatic
        )
    }
}

extension FavouriteView {
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
            ActivityIndicator()
        }
    }
    var errorIndicator: some View {
        Text("Error").offset(y: 80)
    }
    var emptyCategories: some View {
        Text("Category is empty").offset(y: 80)
    }
    var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(
                self.presenter.list,
                id: \.id
            ) { category in
                ZStack {
                    linkBuilder(for: category) {
                        CategoryRow(category: category)
                    }.buttonStyle(PlainButtonStyle())
                }.padding(8)
            }
        }
    }
    func linkBuilder<Content: View>(
        for category: CategoryModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: HomeRouter().makeDetailView(for: category)
        ) { content() }
    }
}
