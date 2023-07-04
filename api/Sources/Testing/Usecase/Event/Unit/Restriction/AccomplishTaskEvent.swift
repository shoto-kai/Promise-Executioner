import Entity
import Usecase

extension AppPromise.FulfillEvent {
    public init() {
        self.init(
            id: .init(),
            promiseID: .init(),
            at: .init(at: 0)
        )
    }
}
