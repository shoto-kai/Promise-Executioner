import Entity

extension Penalty {
    public init() {
        self = .sendUserMessage(
            destine: .init(),
            amount: .init(),
            note: "",
            message: "",
            state: .init()
        )
    }
}
