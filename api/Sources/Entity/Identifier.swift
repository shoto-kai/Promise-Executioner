import Foundation

public struct Identifier<T>: Hashable, Codable {
    public let value: UUID
    public init(_ value: UUID) {
        self.value = value
    }
}
