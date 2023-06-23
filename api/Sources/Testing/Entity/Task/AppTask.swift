import Entity

extension AppTask {
    public init() {
        self.init(
            id: .init(.init()),
            title: "",
            note: "",
            state: .incomplete,
            restriction: .push(deadline: .init(at: 3)),
            penalties: []
        )
    }
}
