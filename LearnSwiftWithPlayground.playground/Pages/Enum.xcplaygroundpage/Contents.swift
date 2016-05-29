/**
 https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html
 */

/********** 1st Example  *************/
/**
- Explicit define enums
- If no type is provided, "Int" will be the default one
  but no default initializer is created.
- By default the value of an enum is equal to it's name
  and hashValue (type "Int") starts from 0
 */
enum CompassPoint {
    case North
    case South
    case East
    case West
}
/**
 CompassPoint(rawValue: 0)
 causes compile error because no default initializer is given
 */

print("Value of \(CompassPoint.North) is \(CompassPoint.North.hashValue)")
// Value of North is 0

print("Value of \(CompassPoint.West) is \(CompassPoint.West.hashValue)")
// Value of West is 3


/********** 2nd Example  *************/
// Define enum with explicit "Int" type

// No 1st default value => start from 0
enum Planet: Int {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
// Create Earth
Planet(rawValue: 2)


// With 1st default value => start from given value
enum Ocean: Int {
    case Pacific = 2, Atlantic, Indian, Southern, Arctic
}
// Create Indian
Ocean(rawValue: 4)


// Default value is set to enum other than the 1st one
enum Season: Int {
    case Spring, Summer, Autumn = 6, Winter
}

print("Value of \(Season.Spring) is \(Season.Spring.rawValue)")
// Value of Spring is 0

print("Value of \(Season.Summer) is \(Season.Summer.rawValue)")
// Value of Summer is 1

print("Value of \(Season.Winter) is \(Season.Winter.rawValue)")
// Value of Winter is 7


/********** 3rd Example  *************/

// Define enum with explicit "String" type and initializer

enum WebError: String {
    case BadRequest = "Bad request. Please check given request header."
    case PageNotFound = "The requested page is not existed."
    case Unknown = "Unknown error."
    
    init(errorCode: Int) {
        switch errorCode {
        case 400:
            self = .BadRequest
        case 404:
            self = .PageNotFound
        default:
            self = .Unknown
        }
    }
}

// BadRequest
let requestError1 = WebError(errorCode: 400)

// PageNotFound
let requestError2 = WebError(errorCode: 404)

// Unknown
let requestError3 = WebError(errorCode: 500)



/********** 4th Example  *************/

/**
 Enum with associated value
 Enum can have functions and 
 */
enum PostalCode {
    case Detail(cityCode: Int, localCode: Int)
    case Brief(String)
    
    func detailToBriefString() -> String {
        if case let PostalCode.Detail(cityCode, localCode) = self {
            return "\(cityCode + localCode)"
        }
        
        return self.toString()
    }
    
    func toDetail() -> PostalCode {
        if case let PostalCode.Brief(briefCode) = self {
            if let code = Int(briefCode) {
                let localCode = code % 1000
                let cityCode = code - localCode
                
                return PostalCode.Detail(cityCode: cityCode, localCode: localCode)
            }
            
            // Better throw error
            return self
        }
        
        return self
    }
    
    func toString() -> String {
        switch self {
        case .Detail(_, _):
            return detailToBriefString()
        case .Brief(let briefCode):
            return briefCode
        }
    }
}

// Paris 13e
let paris13eDetail = PostalCode.Detail(cityCode: 75000, localCode: 13)

// 75013
print(paris13eDetail.toString())

// Paris 20e
let paris20eBrief = PostalCode.Brief("75020")

print(paris20eBrief.toString())

let paris20eDetail = paris20eBrief.toDetail()


