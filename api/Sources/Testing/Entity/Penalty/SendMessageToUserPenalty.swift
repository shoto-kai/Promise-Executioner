import Entity

public extension SendMessageToUserPenalty {
    init() {
        self.init(
            id: .init(.init()),
            destine: .init(),
            amount: 100,
            note: "",
            message: ""
        )
    }
}
