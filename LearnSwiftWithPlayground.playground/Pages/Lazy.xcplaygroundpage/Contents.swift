// http://mikebuss.com/2014/06/22/lazy-initialization-swift/

class Michael {
    var name: String = "Michael"
    lazy var feminine: String = { [unowned self] in
        self.name = "Michelle"
        return self.name
    }()
}

let michael = Michael()

print("Hi! My original name is \(michael.name)")

michael.feminine

print("And now my name is \(michael.name)")