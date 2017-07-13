//import Foundation
//
//let link = "h ttp://nshipster.com/nsdatadetector/  8058133693"
//let address = "1919 Tamarind Avenue Los Angeles CA 90068"
//let phone = "8058133693"
//let date = "1/1/2010"
//let strings = [link, address, phone, date]
//
//let types: NSTextCheckingResult.CheckingType = [.link, .address, .phoneNumber, .date]
//let detector = try? NSDataDetector(types: types.rawValue)
//
//var results: [NSTextCheckingResult] = []
//
//for string in strings {
//    let range = NSMakeRange(0, string.utf16.count)
//    detector?.enumerateMatches(in: string, options: .reportCompletion, range: range) { result, _, _ in
//        if let result = result {
//            results.append(result)
//        }
//    }
//}
//
////print(results)
//
//let range = NSRange.init(location: 0, length: link.characters.count)
//detector?.enumerateMatches(in: link, options: .reportCompletion, range: range) { result, _, _ in
//    print(result)
//}
//
//struct Item {
//    let body: String
//    let itemType: ItemType
//    let textCheckingResult: NSTextCheckingResult
//    
//    init?(textCheckingResult: NSTextCheckingResult) {
//        return nil
//    }
//}
//
//enum ItemType {
//    case link
//    case address
//    case phone
//    case date
//    
//    init?(textCheckingResult: NSTextCheckingResult) {
//        return nil
//    }
//}
