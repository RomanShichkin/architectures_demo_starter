//
//  AppDetailDescriptionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Роман Шичкин on 31.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailDescriptionViewController: UIViewController {
    private let app: ITunesApp
    
    private var appDetailDescriptionView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    init(app: ITunesApp) {
        self.app = app

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congureUI()
    }
    
    private func congureUI() {
        appDetailDescriptionView.versionLabel.text = "Версия \(app.version ?? "")"
        let versionDate: String = DateFormatter.shared.string(from: app.currentVersionReleaseDate ?? Date())
        appDetailDescriptionView.versionDateLabel.text = "\(versionDate)"
        appDetailDescriptionView.setReleaseNoteText(with: app.releaseNotes ?? "")
    }
    
}

