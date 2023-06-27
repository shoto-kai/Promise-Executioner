import Usecase

extension BreakRestrictionEvent {
    public init() {
        self.init(
            id: .init(.init()),
            task: .init(),
            at: .init(at: 0)
        )
    }
}
