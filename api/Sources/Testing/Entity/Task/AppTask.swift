import Entity

extension AppTask {
    public init() {
        self.init(
            id: .init(.init()),
            title: "",
            note: "",
            state: .incomplete,
            conditions: .init(),
            penalties: .init()
        )
    }
}
