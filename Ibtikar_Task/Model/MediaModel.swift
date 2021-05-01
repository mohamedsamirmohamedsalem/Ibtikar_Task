//
//  MediaModel.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import Foundation

// MARK: - MediaModel
struct MediaModel: Codable {
    let data: MediaData?
}

// MARK: - DataClass
struct MediaData: Codable {
    let media: [Media]?
}

// MARK: - Media
struct Media: Codable {
    let type, title: String?
    let coverAsset: MediaCoverAsset?
    let channel: MediaChannel?
}

// MARK: - Channel
struct MediaChannel: Codable {
    let title: String?
}

// MARK: - CoverAsset
struct  MediaCoverAsset: Codable {
    let url: String?
}
