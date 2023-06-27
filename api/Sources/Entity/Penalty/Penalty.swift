public enum Penalty: Hashable, Codable {
    case sendUserMessage(
        destine: User,
        amount: Amount,
        note: String,
        message: String,
        state: State
    )
}

extension Penalty {
    public var state: State {
        each.state
    }

    public var amount: Amount {
        each.amount
    }
}

extension Penalty {
    private var each: some PenaltyCase {
        switch self {
        case .sendUserMessage(
            let destine,
            let amount,
            let note,
            let message,
            let state
        ):
            return SendUserMessageCase(
                destine: destine,
                amount: amount,
                note: note,
                message: message,
                state: state
            )
        }
    }
}
