//: [Previous](@previous)

import Foundation

class Book {
    var content: NSString
    init(content: String) {
        self.content = content
    }
    
    let pageLenght = 5
    
    func getText(pageNumber: Int) -> String {
        return self.content.substringWithRange(NSMakeRange(pageNumber*pageLenght, pageLenght))
    }
}


let book = Book(content: "This is a long long book which holds long long text.")

print(book.getText(0))
print(book.getText(1))
print(book.getText(2))
print(book.getText(3))
print(book.getText(4))
print(book.getText(5))
