//
//  HomeRouter.swift
//  submission-capstone
//
//  Created by MacbookPro13 on 02/01/23.
//

import SwiftUI
import Category
import Core

class HomeRouter {

    func makeDetailView(for category: CategoryModel) -> some View {
        let favoriteUseCase: Interactor<String, CategoryModel, UpdateFavouriteCategoryRepository<GetFavouriteCategoriesLocaleDataSource, CategoryTransformer>>
        = Injection.init().provideUpdateFavorite()
        let presenter = Presenter(useCase: favoriteUseCase)
        return DetailView(presenter: presenter, category: category)
    }
}
