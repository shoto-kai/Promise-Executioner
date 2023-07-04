import Entity
import Foundation

extension PairNotification {
    public init() {
        self.init(
            id: .init(),
            from: .init(),
            to: .init(),
            kind: .init(),
            title: "",
            noticedAt: .init(at: 0),
            readState: .init()
        )
    }
}
