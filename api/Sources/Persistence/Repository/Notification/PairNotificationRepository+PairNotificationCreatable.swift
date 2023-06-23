import Entity
import Fluent
import Repository

extension PairNotificationRepository: PairNotificationCreatable {
    public func create(_ notification: Entity.PairNotification) async throws {
        try await db.transaction { transaction in
            try await notification.toModel.create(on: transaction)
            let kind = notification.kind
            try await kind.toGiftPairModel(of: notification.id.value)?.create(on: transaction)
            try await kind.toPenaltyPairModel(of: notification.id.value)?.create(on: transaction)
            try await kind.toSignPairModel(of: notification.id.value)?.create(on: transaction)
            try await kind.toTerminatePairModel(of: notification.id.value)?.create(on: transaction)
        }
    }
}
