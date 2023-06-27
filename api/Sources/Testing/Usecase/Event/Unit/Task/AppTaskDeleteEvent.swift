import Usecase

extension AppTaskDeleteEvent {
    public init() {
        self.init(
            id: .init(.init()),
            taskID: .init(.init()),
            at: .init()
        )
    }
}
