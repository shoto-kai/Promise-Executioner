import Entity
import Foundation

extension PairNotification {
    public init() {
        self.init(
            id: .init(.init()),
            from: .init(),
            to: .init(),
            kind: .gift(task: .init()),
            title: "",
            noticedAt: .init(at: 0),
            readState: .unread
        )
    }
}
