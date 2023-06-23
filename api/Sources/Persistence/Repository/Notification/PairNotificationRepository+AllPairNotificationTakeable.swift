import Entity
import Fluent
import Repository

extension PairNotificationRepository: AllPairNotificationTakeable {
    public func takeAll(of userID: Entity.User.ID) async throws -> [Entity.PairNotification] {
        try await PairNotification.query(on: db)
            .group(.or) {
                $0
                    .filter(\.$from.$id == userID.value)
                    .filter(\.$to.$id == userID.value)
            }
            .all()
            .map { try $0.toEntity }
    }
}
