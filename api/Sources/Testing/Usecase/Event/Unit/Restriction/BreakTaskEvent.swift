import Entity
import Usecase

extension AppPromise.Task.BreakEvent {
    public init() {
        self.init(
            id: .init(.init()),
            promiseID: .init(.init()),
            task: .init(),
            at: .init(at: 0)
        )
    }
}
