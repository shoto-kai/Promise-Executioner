import Entity
import Usecase

extension AppPromise.UpdateEvent {
    public init() {
        self.init(
            id: .init(.init()),
            promise: .init(),
            at: .init(at: 0)
        )
    }
}
