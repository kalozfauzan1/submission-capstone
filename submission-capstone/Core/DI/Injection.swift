//
//  Injection.swift
//  submission-capstone
//
//  Created by MacbookPro13 on 02/01/23.
//

import Foundation
import RealmSwift
import Core
import Category
import UIKit

final class Injection: NSObject {
    
    func provideUpdateFavorite<U: UseCase>() -> U where U.Request == String, U.Response == CategoryModel {
        
        // swiftlint:disable force_cast
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let locale = GetFavouriteCategoriesLocaleDataSource(realm: appDelegate.realm)
        let mapper = CategoryTransformer()
        let repository = UpdateFavouriteCategoryRepository(
            localeDataSource: locale,
            mapper: mapper)
        return Interactor(repository: repository) as! U
    }
    
    func provideCategory<U: UseCase>() -> U where U.Request == Any, U.Response == [CategoryModel] {
        // swiftlint:disable force_cast
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let locale = GetCategoriesLocaleDataSource(realm: appDelegate.realm)
        let remote = GetCategoriesRemoteDataSource(endpoint: Endpoints.Gets.categories.url)
        let mapper = CategoriesTransformer()
        let repository = GetCategoriesRepository(
            localeDataSource: locale,
            remoteDataSource: remote,
            mapper: mapper)
        return Interactor(repository: repository) as! U
    }
    func provideFavoriteCategory<U: UseCase>() -> U where U.Request == Any, U.Response == [CategoryModel] {
        // swiftlint:disable force_cast
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let locale = GetFavouriteCategoriesLocaleDataSource(realm: appDelegate.realm)
        let remote = GetCategoriesRemoteDataSource(endpoint: Endpoints.Gets.categories.url)
        let mapper = CategoriesTransformer()
        let repository = GetFavouriteCategoriesRepository(
            localeDataSource: locale,
            remoteDataSource: remote,
            mapper: mapper)
        return Interactor(repository: repository) as! U
    }
}
