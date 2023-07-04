import Entity
import Usecase

extension AppPromise.DeleteEvent {
    public init() {
        self.init(
            id: .init(.init()),
            promiseID: .init(.init()),
            at: .init()
        )
    }
}
