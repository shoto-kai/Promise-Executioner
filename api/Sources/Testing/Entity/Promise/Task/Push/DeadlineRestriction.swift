import Entity

extension PushTask.DeadlineRestriction {
    public init() {
        self.init(id: .init(.init()), at: .init(at: 10))
    }
}
