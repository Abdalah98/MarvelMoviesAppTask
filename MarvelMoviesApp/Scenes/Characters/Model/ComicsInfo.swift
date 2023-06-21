//
//  ComicsInfo.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.
//

import Foundation
struct ComicsInfo : Codable {
    let code : Int?
    let status : String?
    let copyright : String?
    let attributionText : String?
    let attributionHTML : String?
    let etag : String?
    let data : ComicsData?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case status = "status"
        case copyright = "copyright"
        case attributionText = "attributionText"
        case attributionHTML = "attributionHTML"
        case etag = "etag"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        attributionText = try values.decodeIfPresent(String.self, forKey: .attributionText)
        attributionHTML = try values.decodeIfPresent(String.self, forKey: .attributionHTML)
        etag = try values.decodeIfPresent(String.self, forKey: .etag)
        data = try values.decodeIfPresent(ComicsData.self, forKey: .data)
    }

}

struct ComicsData : Codable {
    let results : [Results]?
}


struct Results : Codable {

    let title : String?
    let thumbnail : ThumbnailComics?
    let images : [ImagesComics]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case thumbnail = "thumbnail"
        case images = "images"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        thumbnail = try values.decodeIfPresent(ThumbnailComics.self, forKey: .thumbnail)
        images = try values.decodeIfPresent([ImagesComics].self, forKey: .images)
    }

}

struct ThumbnailComics : Codable {
    let path : String!
    let extensions : String!
    
    func getPic () -> String{
        return  path  + "." + extensions
    }
    enum CodingKeys: String, CodingKey {

        case path = "path"
        case extensions = "extension"
    }

}

struct ImagesComics : Codable {
    let path : String?
    let extensions : String?

    enum CodingKeys: String, CodingKey {

        case path = "path"
        case extensions = "extension"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        extensions = try values.decodeIfPresent(String.self, forKey: .extensions)
    }

}
