import Entity

extension Entity.Penalties {
    func toModel(
        of taskID: Entity.AppTask.ID
    ) -> [Persistence.SendMessageToUserPenalty] {
        sendMessageToUser.map { penalty in
            penalty.toModel(of: taskID)
        }
    }
}
