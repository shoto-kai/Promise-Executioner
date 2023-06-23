final class SendUserMessageCase: PenaltyCase {

    private let destine: User
    private let amount: Penalty.Amount
    private let note: String
    private let message: String
    private let _state: Penalty.State

    init(
        destine: User,
        amount: Penalty.Amount,
        note: String,
        message: String,
        state: Penalty.State
    ) {
        self.destine = destine
        self.amount = amount
        self.note = note
        self.message = message
        self._state = state
    }

    override var state: Penalty.State {
        _state
    }
}
