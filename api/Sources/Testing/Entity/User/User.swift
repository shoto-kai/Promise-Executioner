import Foundation
import Entity

extension User {
    public init() {
        self.init(
            id: .init(UUID()),
            name: .init(),
            displayName: "Alice"
        )
    }
}
