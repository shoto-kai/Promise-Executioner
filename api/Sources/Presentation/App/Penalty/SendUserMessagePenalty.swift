import Vapor
import Entity

public struct SendUserMessagePenalty: Content, Hashable {
    
    var destine: User
    
    var amount: Int
    
    var note: String
    
    var message: String
    
}

extension SendUserMessagePenalty {
    public var toEntity: Entity.Penalty {
        get throws {
            try .sendUserMessage(
                destine: destine.toEntity,
                amount: .init(amount),
                note: note,
                message: message,
                state: .unexecuted
            )
        }
    }
}

extension Entity.Penalty {
    public var toSendUserMessageContent: SendUserMessagePenalty? {
        guard case .sendUserMessage(
            let destine,
            let amount,
            let note,
            let message,
            _
        ) = self else {
            return nil
        }
        return .init(
            destine: destine.toContent,
            amount: amount.value,
            note: note,
            message: message
        )
    }
}
