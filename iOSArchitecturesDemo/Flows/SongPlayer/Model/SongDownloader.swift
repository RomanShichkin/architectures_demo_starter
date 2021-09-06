//
//  SongDownloader.swift
//  iOSArchitecturesDemo
//
//  Created by Роман Шичкин on 05.09.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

final class SongDownloader {
    public typealias CompletionSong = (URL) -> Void
    
    func downloadFromURL(_ url: URL, completion: @escaping CompletionSong) {
        var downloadTask: URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: { (localURL, response, error) in
            if let localURL = localURL {
                completion(localURL)
            }
        })
        
        downloadTask.resume()
    }
}
