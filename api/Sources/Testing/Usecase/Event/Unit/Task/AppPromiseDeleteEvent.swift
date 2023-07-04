import Entity
import Usecase

extension AppPromise.DeleteEvent {
    public init() {
        self.init(
            id: .init(),
            promiseID: .init(),
            at: .init()
        )
    }
}
