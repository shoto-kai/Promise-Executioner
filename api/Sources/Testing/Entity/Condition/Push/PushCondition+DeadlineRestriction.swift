import Entity

extension PushCondition.DeadlineRestriction {
    public init() {
        self.init(
            id: .init(.init()),
            deadline: .init(at: 0)
        )
    }
}
