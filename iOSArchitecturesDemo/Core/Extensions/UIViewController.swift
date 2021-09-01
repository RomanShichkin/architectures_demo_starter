//
//  UIViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Роман Шичкин on 31.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var topbarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.statusBarFrame.size.height +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            return self.navigationController?.navigationBar.frame.height ?? 0.0
        }
    }
}
