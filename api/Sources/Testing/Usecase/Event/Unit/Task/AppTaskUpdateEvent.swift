import Usecase

extension AppTaskUpdateEvent {
    public init() {
        self.init(
            id: .init(.init()),
            task: .init(),
            at: .init(at: 0)
        )
    }
}
