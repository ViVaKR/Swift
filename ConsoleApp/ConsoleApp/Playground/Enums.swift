import Foundation

// (15) Enumeration
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet: CaseIterable {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
