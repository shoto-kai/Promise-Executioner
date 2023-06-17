import Entity

extension PushCondition {
    public init() {
        self.init(
            id: .init(.init()),
            state: .incomplete
        )
    }
}
