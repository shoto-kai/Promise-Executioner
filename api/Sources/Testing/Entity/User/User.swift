import Entity
import Foundation

extension User {
    public init() {
        self.init(
            id: .init(UUID()),
            name: .init(),
            displayName: "Alice"
        )
    }
}
