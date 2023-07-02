import Entity
import Foundation
import Repository
import ServiceProtocol
import Usecase

public struct CreateTaskService<T: Repository.AppTaskCreateEventCreatable>: ServiceProtocol
        .TaskCreatable
{

    var creator: T

    public init(_ creator: T) {
        self.creator = creator
    }

    public func create(
        task: AppPromise,
        of user: User,
        at now: Date
    ) async throws {
        let event = AppTaskCreateEvent(
            id: .init(.init()),
            user: user,
            task: task,
            at: now
        )
        try await creator.create(event)
    }
}
