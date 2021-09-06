//
//  SearchMusicBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Роман Шичкин on 05.09.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchMusicBuilder {
    static func build() -> (UIViewController & SearchMusicViewInput) {
        let interactor = SearchMusicInteractor()
        let router = SearchMusicRouter()
        
        let presenter = SearchMusicPresenter(interactor: interactor, router: router)
        
        let viewController = SearchMusicViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        
        return viewController
    }
}
