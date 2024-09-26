//: [Previous](@previous)

import UIKit
import Foundation

protocol NewsArticle {
    var title: String { get }
    var author: String { get }
    var date: Date { get }
    var image: UIImage? { get }
    var content: String { get }
    var articleType: ArticleType { get }
    func play()
}

enum ArticleType {
    case text
    case audio
    case video
}

class TextNewsArticle: NewsArticle {
    var title: String
    var author: String
    var date: Date
    var image: UIImage?
    var content: String
    var articleType: ArticleType
    
    init(title: String, author: String, date: Date, image: UIImage, content: String, articleType: ArticleType) {
        self.title = title
        self.author = author
        self.date = date
        self.image = image
        self.content = content
        self.articleType = articleType
    }
    
    func play() {
        print("Title: \(title)\n content: \(content)")
    }
}

class AudioNewsArticle: NewsArticle {
    var title: String
    var author: String
    var date: Date
    var image: UIImage?
    var content: String
    var articleType: ArticleType
    
    init(title: String, author: String, date: Date, image: UIImage, content: String, articleType: ArticleType) {
        self.title = title
        self.author = author
        self.date = date
        self.image = image
        self.content = content
        self.articleType = articleType
    }
    
    func play() {
        print("Title: \(title)\n content: \(content)")
    }
}
class VideoNewsArticle: NewsArticle {
    var title: String
    var author: String
    var date: Date
    var image: UIImage?
    var content: String
    var articleType: ArticleType
    
    init(title: String, author: String, date: Date, image: UIImage, content: String, articleType: ArticleType) {
        self.title = title
        self.author = author
        self.date = date
        self.image = image
        self.content = content
        self.articleType = articleType
    }
    
    func play() {
        print("Title: \(title)\n content: \(content)")
    }
}

class CreateNewsArticleFactory {
    
    func createNewsArticle(type: ArticleType) -> NewsArticle {
        switch type {
        case .text:
            return TextNewsArticle(title: "Tesla ceo will meet with Narendra Modi on 12 April 2024", author: "Prince Srivastava", date: Date(), image: UIImage(), content: "FactoryDesignPattern.xcplaygroundpage:9:9: note: protocol requires property 'articleType' with type 'ArticleType'; do you want to add a stub", articleType: .text)
        case .audio:
            return TextNewsArticle(title: "Google ceo will meet with Narendra Modi on 15 April 2024", author: "Prince Srivastava", date: Date(), image: UIImage(), content: "FactoryDesignPattern.xcplaygroundpage:9:9: note: protocol requires property 'articleType' with type 'ArticleType'; do you want to add a stub", articleType: .audio)
        case .video:
            return TextNewsArticle(title: "Amazon ceo will meet with Narendra Modi on 17 April 2024", author: "Prince Srivastava", date: Date(), image: UIImage(), content: "FactoryDesignPattern.xcplaygroundpage:9:9: note: protocol requires property 'articleType' with type 'ArticleType'; do you want to add a stub", articleType: .video)
        }
    }
}

let obj = CreateNewsArticleFactory()
let article = obj.createNewsArticle(type: .audio)
article.play()
