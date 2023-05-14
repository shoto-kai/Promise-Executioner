import Foundation
import Entity

public extension PairNotification {
    init() {
        self.init(
            id: .init(.init()),
            from: .init(),
            to: .init(),
            kind: .gift,
            title: "",
            noticedAt: Date(timeIntervalSince1970: 0)
        )
    }
}
