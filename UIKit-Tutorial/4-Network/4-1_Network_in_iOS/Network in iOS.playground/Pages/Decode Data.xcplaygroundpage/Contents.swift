//: [Previous](@previous)

import Foundation

// MARK: - Decode Data
// App Model -> JSON (Encoding)
// JSON(server에서 받아온 값) -> App Model (Decoding)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let appStore = try? JSONDecoder().decode(AppStore.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let appStore = try? JSONDecoder().decode(AppStore.self, from: jsonData)

import Foundation

// MARK: - AppStore
struct AppStore: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let author: Author
    let entry: Entry
    let updated, rights, title, icon: Icon
    let link: [FeedLink]
    let id: Icon
}

// MARK: - Author
struct Author: Codable {
    let name, uri: Icon
}

// MARK: - Icon
struct Icon: Codable {
    let label: String
}

// MARK: - Entry
struct Entry: Codable {
    let imName: Icon
    let imImage: [IMImage]
    let summary: Icon
    let imPrice: IMPrice
    let imContentType: IMContentType
    let rights, title: Icon
    let link: [EntryLink]
    let id: ID
    let imArtist: IMArtist
    let category: Category
    let imReleaseDate: IMReleaseDate

    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case imImage = "im:image"
        case summary
        case imPrice = "im:price"
        case imContentType = "im:contentType"
        case rights, title, link, id
        case imArtist = "im:artist"
        case category
        case imReleaseDate = "im:releaseDate"
    }
}

// MARK: - Category
struct Category: Codable {
    let attributes: CategoryAttributes
}

// MARK: - CategoryAttributes
struct CategoryAttributes: Codable {
    let imID, term: String
    let scheme: String
    let label: String

    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
        case term, scheme, label
    }
}

// MARK: - ID
struct ID: Codable {
    let label: String
    let attributes: IDAttributes
}

// MARK: - IDAttributes
struct IDAttributes: Codable {
    let imID, imBundleID: String

    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
        case imBundleID = "im:bundleId"
    }
}

// MARK: - IMArtist
struct IMArtist: Codable {
    let label: String
    let attributes: IMArtistAttributes
}

// MARK: - IMArtistAttributes
struct IMArtistAttributes: Codable {
    let href: String
}

// MARK: - IMContentType
struct IMContentType: Codable {
    let attributes: IMContentTypeAttributes
}

// MARK: - IMContentTypeAttributes
struct IMContentTypeAttributes: Codable {
    let term, label: String
}

// MARK: - IMImage
struct IMImage: Codable {
    let label: String
    let attributes: IMImageAttributes
}

// MARK: - IMImageAttributes
struct IMImageAttributes: Codable {
    let height: String
}

// MARK: - IMPrice
struct IMPrice: Codable {
    let label: String
    let attributes: IMPriceAttributes
}

// MARK: - IMPriceAttributes
struct IMPriceAttributes: Codable {
    let amount, currency: String
}

// MARK: - IMReleaseDate
struct IMReleaseDate: Codable {
    let label: Date
    let attributes: Icon
}

// MARK: - EntryLink
struct EntryLink: Codable {
    let attributes: PurpleAttributes
    let imDuration: Icon?

    enum CodingKeys: String, CodingKey {
        case attributes
        case imDuration = "im:duration"
    }
}

// MARK: - PurpleAttributes
struct PurpleAttributes: Codable {
    let rel, type: String
    let href: String
    let title, imAssetType: String?

    enum CodingKeys: String, CodingKey {
        case rel, type, href, title
        case imAssetType = "im:assetType"
    }
}

// MARK: - FeedLink
struct FeedLink: Codable {
    let attributes: FluffyAttributes
}

// MARK: - FluffyAttributes
struct FluffyAttributes: Codable {
    let rel: String
    let type: String?
    let href: String
}



// JSON(server에서 받아온 값) -> App Model (Decoding)

// configure -> urlsession -> urlsessionTask

let configuration = URLSessionConfiguration.default

let session = URLSession(configuration: configuration)
let url = URL(string: "https://itunes.apple.com/kr/rss/topfreeapplications/limit=1/json")!

let task = session.dataTask(with: url) { data, response, error in
    
    // 1. response
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        return
    }
    
    // 2. data
    guard let data = data else { return }
    
    // 3. error
    // data -> GithubProfile (Decoding)
    // do-try-catch 구문을 활용 (Errorhandling)
    do {
        // decorder(디코딩을 하는 기능을 담은 주체) = JSONDecorder()
        let decorder = JSONDecoder()
        
        // Data 타입을 별도의 Decoding을 하지 않은 경우, Double값으로 Decoding을 실시하기 때문에 데이터 표준에 따라 아래와 같은 코드를 추가해야함
        decorder.dateDecodingStrategy = .iso8601
        
        // 실제 Model의 데이터로 가져오기 위해 'try'함
        // decode(Model 데이터, from: 서버 데이터)
        let appstore = try decorder.decode(AppStore.self, from: data)
//        print("AppInfo: \(appstore.feed.entry.category.attributes.label)")
    } catch let error as NSError {
        print("error : \(error)")
    }
}


task.resume()
/*
 // 올바르게 잘 출력됨!
 profiles: GithubProfile(login: "onthelots", avatarUrl: "https://avatars.githubusercontent.com/u/107039500?v=4", htmlUrl: "https://github.com/onthelots", followers: 14, following: 16)
 */



//: [Next](@next)
