import Entity
import Vapor

public struct AppPromise: Content, Hashable {

    var id: UUID

    var title: String

    var note: String

    var state: Self.State

    var pushTask: Self.PushTask

    var sendUserMessagePenalties: [SendUserMessagePenalty]

}

extension AppPromise {
    public var toEntity: Entity.AppPromise {
        get throws {
            return try .init(
                id: .init(id),
                title: title,
                note: note,
                state: .incomplete,
                task: pushTask.toEntity,
                penalties: sendUserMessagePenalties.map { try $0.toEntity }
            )
        }
    }
}

extension Entity.AppPromise {
    public var toContent: AppPromise {
        get throws {
            guard case .push(_) = self.task else {
                throw Abort(.internalServerError)
            }
            return .init(
                id: id.value,
                title: title,
                note: note,
                state: state.toContent,
                pushTask: task.toPushTaskContent!,
                sendUserMessagePenalties: penalties.compactMap {
                    $0.toSendUserMessageContent
                }
            )
        }
    }
}
