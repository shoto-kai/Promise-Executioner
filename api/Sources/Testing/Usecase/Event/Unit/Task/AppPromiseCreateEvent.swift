import Entity
import Usecase

extension AppPromise.CreateEvent {
    public init() {
        self.init(
            id: .init(),
            user: .init(),
            promise: .init(),
            at: .init(at: 0)
        )
    }
}
