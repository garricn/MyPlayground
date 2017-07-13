
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

import Foundation
import UIKit

struct Private {
    static let apiKey = "3ac66971a7d99a38e522d76759fca2e1"
}

let baseURLString = "https://api.flickr.com/services/rest/"
let method = "flickr.galleries.getPhotos"
let galleryID = "72157664540660544"
let apiKey = Private.apiKey
let queryString = "?method=\(method)&api_key=\(apiKey)&gallery_id=\(galleryID)&format=json&nojsoncallback=1"
let urlString = baseURLString.appending(queryString)

let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
let url = URL(string: encoded)!

//var request = URLRequest(url: url)
//request.httpMethod = "GET"

var images: [UIImage] = []

URLSession.shared.dataTask(with: url) { data, response, error in
    guard let data = data else {
        if let response = response {
            print("Respone: \(response)")
        }
        if let error = error {
            print("Error: \(error)")
        }
        return
    }

    do {
        let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)

        guard let json = object as? [String: Any] else {
            return
        }

        let dict = json["photos"] as? [String: Any] ?? [:]
        let photos = dict["photo"] as? [[String: Any]] ?? []

//        self.items.removeAll()

        for photo in photos {
            let farmID = photo["farm"] as? Int ?? -1
            let serverID = photo["server"] as? String ?? ""
            let photoID = photo["id"] as? String ?? ""
            let secret = photo["secret"] as? String ?? ""

            let baseURLString = "https://farm\(farmID).staticflickr.com/"
            let resourceString = baseURLString.appending("\(serverID)/\(photoID)_\(secret)_z.jpg")

            guard
                let encoded = resourceString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                let url = URL(string: encoded),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data)
                else { return }


            images.append(image)
        }

        DispatchQueue.main.async {
//            self.tableView.reloadData()
//            self.refreshControl?.endRefreshing()
        }

    } catch {
        print(error)
    }
}.resume()

let string = "http://www.telegraph.co.uk/content/dam/news/2016/09/08/107667228_beech-tree-NEWS-large_trans_NvBQzQNjv4BqplGOf-dgG3z4gg9owgQTXEmhb5tXCQRHAvHRWfzHzHk.jpg"

let url1 = URL(string: string)!

URLSession.shared.dataTask(with: url1) { data, response, error in
    if let data = data {
        print(data)
    }

    if let response = response {
        print(response)
    }

    if let error = error {
        print(error)
    }
}.resume()
























