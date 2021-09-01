//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)

        return scrollView
    }()
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    public var app: ITunesApp
    
//    private let imageDownloader = ImageDownloader()
    lazy var headerViewController = AppDetailHeaderViewController(app: app)
    lazy var descriptionViewController = AppDetailDescriptionViewController(app: app)
//    lazy var descriptionVC = UIViewController()
    lazy var screenshotsViewController = AppDetailScreenshotsViewController(app: app)
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
//    override func loadView() {
//        super.loadView()
//        self.view = AppDetailView()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.configureNavigationController()
//        self.downloadImage()
        
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        super.viewDidLoad()
        
        addScrollViewConstraints()
        addHeaderViewController()
        addDescriptionViewController()
        addScreenshotsViewController()
        
    }
    
    private func addScrollViewConstraints() {
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    private func addHeaderViewController() {
        contentView.addSubview(headerViewController.view)
        addChild(headerViewController)
        
        headerViewController.didMove(toParent: self)
        
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            headerViewController.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        contentView.addSubview(descriptionViewController.view)
        addChild(descriptionViewController)
        descriptionViewController.didMove(toParent: self)
        
        descriptionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionViewController.view.topAnchor.constraint(equalTo: headerViewController.view.bottomAnchor),
            descriptionViewController.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            descriptionViewController.view.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
//    private func addDescriptionViewController() {
//        //Дз
//        self.addChild(descriptionVC)
//        self.view.addSubview(descriptionVC.view)
//        descriptionVC.didMove(toParent: self)
//
//        descriptionVC.view.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            descriptionVC.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
//            descriptionVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
//            descriptionVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
//        ])
//    }
//
    private func addScreenshotsViewController() {
        contentView.addSubview(screenshotsViewController.view)
        addChild(screenshotsViewController)
        
        screenshotsViewController.didMove(toParent: self)
        
        screenshotsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenshotsViewController.view.topAnchor.constraint(equalTo: descriptionViewController.view.bottomAnchor),
            screenshotsViewController.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            screenshotsViewController.view.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            screenshotsViewController.view.heightAnchor.constraint(equalToConstant: 500),
            screenshotsViewController.view.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
