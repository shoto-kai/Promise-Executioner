import Foundation

public struct BearerToken: Hashable, Codable {
    
    public let value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public init(_ uuid: UUID = UUID()) {
        self.init(uuid.uuidString)
    }
}
