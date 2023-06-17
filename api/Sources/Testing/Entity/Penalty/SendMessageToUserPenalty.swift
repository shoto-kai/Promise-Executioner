import Entity

extension SendMessageToUserPenalty {
    public init() {
        self.init(
            id: .init(.init()),
            destine: .init(),
            amount: 100,
            note: "",
            message: ""
        )
    }
}
