//
//  FeedModel.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

// https://app.quicktype.io/ 사용
//   let feedModel = try FeedModel(json)

import Foundation

struct FeedModel: Codable {
    let feed: Feed?
}

struct Feed: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright, country: String?
    let icon: String?
    let updated: String?
    let results: [Result]?
}

struct Author: Codable {
    let name: String?
    let uri: String?
}

struct Link: Codable {
    let linkSelf: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }
}

struct Result: Codable {
    let artistName, id, releaseDate, name: String?
    let kind: Kind?
    let copyright, artistID: String?
    let artistURL: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?
    let contentAdvisoryRating: ContentAdvisoryRating?
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
}

enum ContentAdvisoryRating: String, Codable {
    case explicit = "Explicit"
}

struct Genre: Codable {
    let genreID, name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case iosSoftware = "iosSoftware"
}

// MARK: Convenience initializers and mutators

extension FeedModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FeedModel.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        feed: Feed?? = nil
        ) -> FeedModel {
        return FeedModel(
            feed: feed ?? self.feed
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Feed {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Feed.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        title: String?? = nil,
        id: String?? = nil,
        author: Author?? = nil,
        links: [Link]?? = nil,
        copyright: String?? = nil,
        country: String?? = nil,
        icon: String?? = nil,
        updated: String?? = nil,
        results: [Result]?? = nil
        ) -> Feed {
        return Feed(
            title: title ?? self.title,
            id: id ?? self.id,
            author: author ?? self.author,
            links: links ?? self.links,
            copyright: copyright ?? self.copyright,
            country: country ?? self.country,
            icon: icon ?? self.icon,
            updated: updated ?? self.updated,
            results: results ?? self.results
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Author {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Author.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        name: String?? = nil,
        uri: String?? = nil
        ) -> Author {
        return Author(
            name: name ?? self.name,
            uri: uri ?? self.uri
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Link {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Link.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        linkSelf: String?? = nil,
        alternate: String?? = nil
        ) -> Link {
        return Link(
            linkSelf: linkSelf ?? self.linkSelf,
            alternate: alternate ?? self.alternate
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Result {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Result.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        artistName: String?? = nil,
        id: String?? = nil,
        releaseDate: String?? = nil,
        name: String?? = nil,
        kind: Kind?? = nil,
        copyright: String?? = nil,
        artistID: String?? = nil,
        artistURL: String?? = nil,
        artworkUrl100: String?? = nil,
        genres: [Genre]?? = nil,
        url: String?? = nil,
        contentAdvisoryRating: ContentAdvisoryRating?? = nil
        ) -> Result {
        return Result(
            artistName: artistName ?? self.artistName,
            id: id ?? self.id,
            releaseDate: releaseDate ?? self.releaseDate,
            name: name ?? self.name,
            kind: kind ?? self.kind,
            copyright: copyright ?? self.copyright,
            artistID: artistID ?? self.artistID,
            artistURL: artistURL ?? self.artistURL,
            artworkUrl100: artworkUrl100 ?? self.artworkUrl100,
            genres: genres ?? self.genres,
            url: url ?? self.url,
            contentAdvisoryRating: contentAdvisoryRating ?? self.contentAdvisoryRating
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Genre {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Genre.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        genreID: String?? = nil,
        name: String?? = nil,
        url: String?? = nil
        ) -> Genre {
        return Genre(
            genreID: genreID ?? self.genreID,
            name: name ?? self.name,
            url: url ?? self.url
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

fileprivate func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

fileprivate func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
