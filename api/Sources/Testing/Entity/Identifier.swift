import Entity
import Foundation

extension Identifier {

    public init() {
        self.init(UUID())
    }

    public init(_ uuidString: String) {
        self.init(.init(uuidString: uuidString)!)
    }
}
