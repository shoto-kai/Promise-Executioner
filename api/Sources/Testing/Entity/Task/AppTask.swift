import Entity

public extension AppTask {
    init() {
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
