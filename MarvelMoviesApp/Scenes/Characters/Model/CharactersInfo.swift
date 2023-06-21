//
//  CharactersInfo.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.
//

import Foundation
struct CharactersInfo : Codable {
    let code : Int?
    let status : String?
    let copyright : String?
    let attributionText : String?
    let attributionHTML : String?
    let etag : String?
    let data : CharactersData?

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
        data = try values.decodeIfPresent(CharactersData.self, forKey: .data)
    }

}
struct CharactersData : Codable {
    let offset : Int?
    let limit : Int?
    let total : Int?
    let count : Int?
    let results : [ResultsCharacters]?

    enum CodingKeys: String, CodingKey {

        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        results = try values.decodeIfPresent([ResultsCharacters].self, forKey: .results)
    }

}

struct ResultsCharacters : Codable {
    let id : Int?
    let name : String?
    let description : String?
    let modified : String?
    let thumbnail : Thumbnail?
    let resourceURI : String?
    let comics : Comics?
    let series : SeriesCharacters?
    let stories : Stories?
    let events : Events?
    let urls : [Urls]?

    enum CodingKeys: String, CodingKey {
       
        case id = "id"
        case name = "name"
        case description = "description"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case resourceURI = "resourceURI"
        case comics = "comics"
        case series = "series"
        case stories = "stories"
        case events = "events"
        case urls = "urls"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        modified = try values.decodeIfPresent(String.self, forKey: .modified)
        thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
        resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
        comics = try values.decodeIfPresent(Comics.self, forKey: .comics)
        series = try values.decodeIfPresent(SeriesCharacters.self, forKey: .series)
        stories = try values.decodeIfPresent(Stories.self, forKey: .stories)
        events = try values.decodeIfPresent(Events.self, forKey: .events)
        urls = try values.decodeIfPresent([Urls].self, forKey: .urls)
    }

}
struct Stories : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [Items]?
    let returned : Int?

    enum CodingKeys: String, CodingKey {

        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        available = try values.decodeIfPresent(Int.self, forKey: .available)
        collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
        returned = try values.decodeIfPresent(Int.self, forKey: .returned)
    }

}
struct SeriesCharacters : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [ItemsCharacters]?
    let returned : Int?

    enum CodingKeys: String, CodingKey {

        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        available = try values.decodeIfPresent(Int.self, forKey: .available)
        collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
        items = try values.decodeIfPresent([ItemsCharacters].self, forKey: .items)
        returned = try values.decodeIfPresent(Int.self, forKey: .returned)
    }

}
struct Comics : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [Items]?
    let returned : Int?

    enum CodingKeys: String, CodingKey {

        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        available = try values.decodeIfPresent(Int.self, forKey: .available)
        collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
        returned = try values.decodeIfPresent(Int.self, forKey: .returned)
    }

}
struct Events : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [Items]?
    let returned : Int?

    enum CodingKeys: String, CodingKey {

        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        available = try values.decodeIfPresent(Int.self, forKey: .available)
        collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
        returned = try values.decodeIfPresent(Int.self, forKey: .returned)
    }

}


struct ItemsCharacters : Codable {
    let resourceURI : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case resourceURI = "resourceURI"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}

struct Thumbnail : Codable {
    let path : String!
    let extensions : String!
    
    func getPic () -> String{
        return  path  + "." + extensions 
    }
    enum CodingKeys: String, CodingKey {

        case path = "path"
        case extensions = "extension"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        path = try values.decodeIfPresent(String.self, forKey: .path)
//        extensions = try values.decodeIfPresent(String.self, forKey: .extensions)
//    }

}
struct Items : Codable {
    let resourceURI : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case resourceURI = "resourceURI"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
struct Urls : Codable {
    let type : String?
    let url : String?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}
/*
 func getPic () -> String{
   return "\(Defaults.baseURL)/uploads/" + (pic ?? "")
 }
 */
