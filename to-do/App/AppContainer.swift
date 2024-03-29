//
//  AppContainer.swift
//  to-do
//
//  Created by mert.kutluca on 3.03.2021.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let databaseManager: DatabaseManager = RealmManager()
    let networkManager: NetworkManageerProtocol = NetworkManager()
    let imageDownloadManager: ImageDownloadManagerProtocol = ImageDownloadManager()
}
