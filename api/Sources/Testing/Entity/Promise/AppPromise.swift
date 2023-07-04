import Entity

extension AppPromise {
    public init() {
        self.init(
            id: .init(),
            title: "",
            note: "",
            state: .init(),
            task: .init(),
            penalties: []
        )
    }
}
