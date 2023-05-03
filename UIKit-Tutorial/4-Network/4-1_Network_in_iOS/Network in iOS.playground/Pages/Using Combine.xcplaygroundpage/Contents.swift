//: [Previous](@previous)

//import Foundation
//import Combine
//
//enum NetworkError: Error {
//    case invalidRequest
//    case responseError(statusCode: Int)
//}
//
//struct GithubProfile: Codable {
//    let login: String
//    let avatarUrl: String
//    let htmlUrl: String
//    let followers: Int
//    let following: Int
//
//    enum CodingKeys: String, CodingKey {
//        case login
//        case avatarUrl = "avatar_url"
//        case htmlUrl = "html_url"
//        case followers
//        case following
//    }
//}
//
//// Combine을 활용하여 네트워크 서비스를 호출하시오
//
//final class NetworkService {
//    let session: URLSession
//
//    init(configure: URLSessionConfiguration) {
//        self.session = URLSession(configuration: configure)
//    }
//
//    // fetch function
//    func fetchProfiles(nickname: String) -> AnyPublisher<GithubProfile, Error> {
//        let urlString: String = "https://api.github.com/users/\(nickname)"
//        let url = URL(string: urlString)! // 강제 바인딩
//
//        return session
//            .dataTaskPublisher(for: url)
//            .tryMap { result -> Data in // result는 data, response 2가지 타입을 가지고 있음
//                guard let response = result.response as? HTTPURLResponse,
//                      (200..<300).contains(response.statusCode)
//                else {
//                    let response = result.response as? HTTPURLResponse
//                    let statusCode = response?.statusCode ?? -1 // response 자체가 옵셔널 값이므로, ?? (nil coalescing)을 활용하여 nil 값일 경우 -1을 반환하도록 함
//                    throw NetworkError.responseError(statusCode: statusCode) // Errorhandling
//                }
//                return result.data // data를 반환!
//            }
//            // decoding
//            .decode(type: GithubProfile.self, decoder: JSONDecoder())
//            // eraseToAnyPublisher -> 내부 파이프라인을 감추고, Scope 외부에서 타입을 복잡하게 선언시키지 않기 위해
//            .eraseToAnyPublisher()
//    }
//}
//
//let networkService = NetworkService(configure: .default)
//let subscription = networkService
//    .fetchProfiles(nickname: "onthelots")
//    .receive(on: RunLoop.main)
//    .sink { error in
//        print("Error : \(error)")
//    } receiveValue: { profle in
//        print("Profile : \(profle)")
//    }



import Foundation
import Combine

// MARK: - AppStore
struct AppStore: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let author: Author
    let entry: [Entry]
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

enum NetworkError: Error {
    case invalidRequest
    case responseError(statusCode: Int)
}


final class NetworkService {
    let session: URLSession
    
    init(configure: URLSessionConfiguration) {
        self.session = URLSession(configuration: configure)
    }
    
    // fetch function
    func fetchFeed(limit: Int) -> AnyPublisher<Feed, Error> {
        let urlString: String = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=\(limit)/json"
        let url = URL(string: urlString)! // 강제 바인딩
        
        return session
            .dataTaskPublisher(for: url)
            .tryMap { result -> Data in // result는 data, response 2가지 타입을 가지고 있음
                guard let response = result.response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode)
                else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1 // response 자체가 옵셔널 값이므로, ?? (nil coalescing)을 활용하여 nil 값일 경우 -1을 반환하도록 함
                    throw NetworkError.responseError(statusCode: statusCode) // Errorhandling
                }
                return result.data // data를 반환!
            }
            // decoding
            .decode(type: Feed.self, decoder: JSONDecoder())
            // eraseToAnyPublisher -> 내부 파이프라인을 감추고, Scope 외부에서 타입을 복잡하게 선언시키지 않기 위해
            .eraseToAnyPublisher()
    }
}

let networkService = NetworkService(configure: .default)
let subscription = networkService
    .fetchFeed(limit: 10)
    .receive(on: RunLoop.main)
    .sink { error in
        print("Error : \(error)")
    } receiveValue: { feed in
        print("Feed : \(feed)")
    }





// NetworkService
//final class NetworkService {
//    // URLSession
//    let session: URLSession
//
//    // URLConfigure 초기화
//    init(configure: URLSessionConfiguration) {
//        session = URLSession(configuration: configure)
//    }
//
//    // Combine화 (기존에 Result타입이 아닌, AnyPublisher를 반환하는 형태로 작성)
//    func fetchProfiles(username: String) -> AnyPublisher<GithubProfile, Error> {
//        // url 주소를 인자로 받아오기 위해 파라미터 설정
//        let url = URL(string: "https://api.github.com/users/\(username)")!
//
//        // MARK: - dataTaskPublisher 생성
//        let publisher = session
//            .dataTaskPublisher(for: url)
//
//        // result -> data, Response 2가지가 있음
//        // 2. Response / data
//            .tryMap { result -> Data in
//                guard let httpResponse = result.response as? HTTPURLResponse,
//                      (200..<300).contains(httpResponse.statusCode) else {
//
//                    let response = result.response as? HTTPURLResponse
//                    let statusCode = response?.statusCode ?? -1 // statusCode가 없으면?
//                    // 3. error
//                    throw NetworkError.responseError(statusCode: statusCode) // Error를 throw
//                }
//                return result.data
//            }
//
//            // 4. decoding
//            .decode(type: GithubProfile.self, decoder: JSONDecoder())
//
//            // 기타. 타입을 지운뒤 반환하는 형태 -> 퍼블리셔를 만드는 과정(혹은 파이프라인)을 외부로부터 숨기고, 최종적인 형태의 퍼블리셔만을 리턴할 수 있도록
//            .eraseToAnyPublisher() // 타입을 지우는 역할
//
//        return publisher
//    }
//}

// 퍼블리셔가 되며,
//let networkService = NetworkService(configure: .default)
//
//// 아래 subscription으로 할당할 수 있음
//let subscription = networkService
//    .fetchProfiles(username: "onthelots")
//    .receive(on: RunLoop.main)
//    .sink { completion in
//        print("completion : \(completion)")
//    } receiveValue: { profile in
//        print("profile: \(profile)")
//    }






//: [Next](@next)



