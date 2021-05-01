//
//  Channels.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import Foundation

// MARK: - ChannelsModel
struct ChannelsModel: Codable {
    let data: ChannelsData?
}

// MARK: - DataClass
struct ChannelsData: Codable {
    let channels: [Channel]?
}

// MARK: - Channel
struct Channel: Codable {
    let title: String?
    let series: [Series]?
    let mediaCount: Int?
    let latestMedia: [LatestMedia]?
    let id: String?
    let iconAsset: IconAsset?
    let coverAsset: CoverAsset?
    let slug: String?
}

// MARK: - CoverAsset
struct CoverAsset: Codable {
    let url: String?
}

// MARK: - IconAsset
struct IconAsset: Codable {
    let thumbnailURL: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case url
    }
}

// MARK: - LatestMedia
struct LatestMedia: Codable {
    let type: TypeEnum?
    let title: String?
    let coverAsset: CoverAsset?
}

enum TypeEnum: String, Codable {
    case course = "course"
    case video = "video"
}

// MARK: - Series
struct Series: Codable {
    let title: String?
    let coverAsset: CoverAsset?
    let id: String?
}
