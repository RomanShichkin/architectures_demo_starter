//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    static let shared = AppStartManager()
    private init() {}
    
    private enum Screens {
        case appSearch
        case musicSearch
    }
    private var currentScreen: Screens = .appSearch
    
    func start(window: UIWindow) {
        currentScreen = .appSearch
        let rootVC = SearchBuilder.build()
        rootVC.navigationItem.title = "Поиск по приложениям iTunes"
        
        let navVC = self.configuredNavigationController
        navVC.viewControllers = [rootVC]
        
        window.rootViewController = navVC
        window.makeKeyAndVisible()
    }
    
    func openAppSearch() {
        currentScreen = .appSearch
        let rootVC = SearchBuilder.build()
        rootVC.navigationItem.title = "Поиск по приложениям iTunes"
        
        UIView.transition(
            with: configuredNavigationController.view,
            duration: 0.4,
            options: .transitionFlipFromLeft,
            animations: {
                self.configuredNavigationController.setViewControllers([rootVC], animated: true)
            }, completion: nil)
    }
    
    func openMusicSearch() {
        
        currentScreen = .musicSearch
        let rootVC = SearchMusicBuilder.build()
        rootVC.navigationItem.title = "Поиск по музыке iTunes"
        
        UIView.transition(
            with: configuredNavigationController.view,
            duration: 0.4,
            options: .transitionFlipFromRight,
            animations: {
                self.configuredNavigationController.setViewControllers([rootVC], animated: true)
            }, completion: nil)
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
}
