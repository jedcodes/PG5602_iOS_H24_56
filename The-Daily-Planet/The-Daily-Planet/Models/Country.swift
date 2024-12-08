import Foundation
import SwiftData

@Model
final class Country {
    @Attribute(.unique) var countryCode: String
    
    init(countryCode: String) {
        self.countryCode = countryCode
    }
}
