//: [Previous](@previous)

import Foundation

// MARK: - Decode Data
// App Model -> JSON (Encoding)
// JSON(server에서 받아온 값) -> App Model (Decoding)

struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    // 코딩키 -> JSON에서의 방식을 그대로 맞춰주자 (일종의 매칭을 위한 Enumeration)
    // github 데이터에서는 htmlUrl이 아닌, "html_url"로 되어있기 때문에
    // case의 초기값을 적합하게 설정해 줌
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

// JSON(server에서 받아온 값) -> App Model (Decoding)

// configure -> urlsession -> urlsessionTask

let configuration = URLSessionConfiguration.default

let session = URLSession(configuration: configuration)
let url = URL(string: "https://api.github.com/users/onthelots")!

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
        
        // 실제 Model의 데이터로 가져오기 위해 'try'함
        // decode(Model 데이터, from: 서버 데이터)
        let profile = try decorder.decode(GithubProfile.self, from: data)
        print("profiles: \(profile)")
    } catch let error as NSError {
        print("error : \(error)")
    }
    
    task.resume()
}
/*
 // 올바르게 잘 출력됨!
 profiles: GithubProfile(login: "onthelots", avatarUrl: "https://avatars.githubusercontent.com/u/107039500?v=4", htmlUrl: "https://github.com/onthelots", followers: 14, following: 16)
 */



//: [Next](@next)
