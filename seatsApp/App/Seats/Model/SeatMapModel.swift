
import Foundation

struct SeatMapModel: Codable {
    let airline: Airline
    let boardPoint: String
    let docType: String
    let fltKey: Int
    let fltNo: String
    let fltSuffix: String
    let items: [Item]
    let offPoint: String
    let opLocalTime: String
    let id: String
    let rev: String
    let channels: [String]

    enum CodingKeys: String, CodingKey {
        case airline = "Airline"
        case boardPoint = "BoardPoint"
        case docType = "DocType"
        case fltKey = "FltKey"
        case fltNo = "FltNo"
        case fltSuffix = "FltSuffix"
        case items = "Items"
        case offPoint = "OffPoint"
        case opLocalTime = "OpLocalTime"
        case id = "_id"
        case rev = "_rev"
        case channels
    }
}

enum Airline: String, Codable {
    case ai = "AI"
}

// MARK: - Item
struct Item: Codable {
    let airLine: Airline
    let aisle: Int
    let cabinClass: CabinClass
    let cabinSideA, cabinSideB, cabinSideC, cabinSideD: CabinSideAEnum
    let cabinSideE: CabinSideAEnum
    let cabinSideF, cabinSideG: CabinSideFEnum
    let cabinSideH: CabinSideAEnum
    let cabinSideJ, cabinSideK: CabinSideFEnum
    let configA, configB, configC, configD: Config
    let configE, configF, configG, configH: Config
    let configJ, configK: Config
    let deck: Deck
    let fltKey: Int
    let isDeleted: Bool
    let rowA, rowB, rowC, rowD: Row
    let rowE, rowF, rowG, rowH: Row
    let rowJ, rowK: Row
    let source: Source

    enum CodingKeys: String, CodingKey {
        case airLine = "AirLine"
        case aisle = "Aisle"
        case cabinClass = "CabinClass"
        case cabinSideA = "CabinSideA"
        case cabinSideB = "CabinSideB"
        case cabinSideC = "CabinSideC"
        case cabinSideD = "CabinSideD"
        case cabinSideE = "CabinSideE"
        case cabinSideF = "CabinSideF"
        case cabinSideG = "CabinSideG"
        case cabinSideH = "CabinSideH"
        case cabinSideJ = "CabinSideJ"
        case cabinSideK = "CabinSideK"
        case configA = "ConfigA"
        case configB = "ConfigB"
        case configC = "ConfigC"
        case configD = "ConfigD"
        case configE = "ConfigE"
        case configF = "ConfigF"
        case configG = "ConfigG"
        case configH = "ConfigH"
        case configJ = "ConfigJ"
        case configK = "ConfigK"
        case deck = "Deck"
        case fltKey = "FltKey"
        case isDeleted = "IsDeleted"
        case rowA = "RowA"
        case rowB = "RowB"
        case rowC = "RowC"
        case rowD = "RowD"
        case rowE = "RowE"
        case rowF = "RowF"
        case rowG = "RowG"
        case rowH = "RowH"
        case rowJ = "RowJ"
        case rowK = "RowK"
        case source = "Source"
    }
}

enum CabinClass: String, Codable {
    case f = "F"
    case j = "J"
    case y = "Y"
}

enum CabinSideAEnum: String, Codable, RawRepresentable {
    case l = "L"
    case o = "O"
    case r = "R"
    case s = "S"
    case xb = "XB"
    case xl = "XL"
    case xp = "XP"
    case xr = "XR"
    case xs = "XS"
    case xu = "XU"
}

enum CabinSideFEnum: String, Codable, RawRepresentable {
    case p = "P"
    case r = "R"
    case u = "U"
    case xp = "XP"
    case xr = "XR"
    case xu = "XU"
}

// MARK: - Config
struct Config: Codable {
    let primary: [Primary]
    let secondary: Secondary

    enum CodingKeys: String, CodingKey {
        case primary = "Primary"
        case secondary = "Secondary"
    }
}

enum Primary: String, Codable {
    case b = "B"
    case e = "E"
    case l = "L"
    case o = "O"
}

enum Secondary: String, Codable {
    case a = "A"
    case empty = ""
    case m = "M"
    case w = "W"
}

enum Deck: String, Codable {
    case m = "M"
    case u = "U"
}

enum Row: String, Codable {
    case a = "A"
    case b = "B"
    case x = "X"
}

enum Source: String, Codable {
    case inbound = "Inbound"
}

