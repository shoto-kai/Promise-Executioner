import Entity

public extension PushCondition {
    init() {
        self.init(
            id: .init(.init()),
            state: .incomplete
        )
    }
}
