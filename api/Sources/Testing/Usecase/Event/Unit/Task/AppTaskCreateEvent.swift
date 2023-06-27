import Usecase

extension AppTaskCreateEvent {
    public init() {
        self.init(
            id: .init(.init()),
            user: .init(),
            task: .init(),
            at: .init(at: 0)
        )
    }
}
