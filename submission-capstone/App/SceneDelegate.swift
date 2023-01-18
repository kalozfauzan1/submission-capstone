//
//  SceneDelegate.swift
//  submission-capstone
//
//  Created by MacbookPro13 on 02/01/23.
//

import UIKit
import SwiftUI
import RealmSwift
import Core
import Category

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let injection = Injection()
        let favoriteUseCase: Interactor<
            Any,
            [CategoryModel],
            GetFavouriteCategoriesRepository<
                GetFavouriteCategoriesLocaleDataSource,
                GetCategoriesRemoteDataSource,
                CategoriesTransformer>
        > = injection.provideFavoriteCategory()
        let categoryUseCase: Interactor<
            Any,
            [CategoryModel],
            GetCategoriesRepository<
                GetCategoriesLocaleDataSource,
                GetCategoriesRemoteDataSource,
                CategoriesTransformer>
        > = injection.provideCategory()
        let homePresenter = GetListPresenter(useCase: categoryUseCase)
        let favoritePresenter = GetListPresenter(useCase: favoriteUseCase)
        let contentView = ContentView()
            .environmentObject(homePresenter)
            .environmentObject(favoritePresenter)
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
