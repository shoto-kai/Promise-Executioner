import Entity
import Vapor

public struct AppTask: Content, Hashable {

    var id: UUID

    var title: String

    var note: String

    var state: State

    var pushRestriction: PushRestriction?

    var sendUserMessagePenalties: [SendUserMessagePenalty]

}

extension AppTask {
    public var toEntity: Entity.AppTask {
        get throws {
            guard let restriction = pushRestriction else {
                throw Abort(.badRequest)
            }
            return try .init(
                id: .init(id),
                title: title,
                note: note,
                state: .incomplete,
                restriction: restriction.toEntity,
                penalties: sendUserMessagePenalties.map { try $0.toEntity })
        }
    }
}

extension Entity.AppTask {
    public var toContent: AppTask {
        .init(
            id: id.value,
            title: title,
            note: note,
            state: state.toContent,
            sendUserMessagePenalties: penalties.compactMap {
                $0.toSendUserMessageContent
            }
        )
    }
}
