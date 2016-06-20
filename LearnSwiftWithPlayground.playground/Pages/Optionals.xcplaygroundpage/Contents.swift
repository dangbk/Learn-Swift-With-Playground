//Optional variable is nil by default

class Band {
    let name: String? = nil
    let members: [String]? = nil
    let album: [String]?
    init() {
        self.name = ""
        self.album = []
    }
}