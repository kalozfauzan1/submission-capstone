//
//  ContentView.swift
//  submission-capstone
//
//  Created by MacbookPro13 on 02/01/23.
//

import SwiftUI
import Core
import Category

struct ContentView: View {
    // swiftlint:disable line_length
    @EnvironmentObject var homePresenter: GetListPresenter<Any, CategoryModel, Interactor<Any, [CategoryModel], GetCategoriesRepository<GetCategoriesLocaleDataSource, GetCategoriesRemoteDataSource, CategoriesTransformer>>>
    @EnvironmentObject var favoritePresenter: GetListPresenter<Any, CategoryModel, Interactor<Any, [CategoryModel], GetFavouriteCategoriesRepository<GetFavouriteCategoriesLocaleDataSource, GetCategoriesRemoteDataSource, CategoriesTransformer>>>
    var body: some View {
        TabView {
            NavigationView {
                HomeView(presenter: homePresenter)
            }.tabItem {
                TabItem(imageName: "house", title: "Home")
            }
            NavigationView {
                FavouriteView(presenter: _favoritePresenter)
            }.tabItem {
                TabItem(imageName: "heart", title: "Favorite")
            }
            NavigationView {
                AboutView()
            }.tabItem {
                TabItem(imageName: "person.fill", title: "About")
            }
        }
    }
}
