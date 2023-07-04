import Entity
import Usecase

extension AppPromise.BreakEvent {
    public init() {
        self.init(
            id: .init(),
            user: .init(),
            promiseID: .init(),
            at: .init(at: 0)
        )
    }
}
