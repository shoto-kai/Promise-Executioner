import Entity
import Fluent
import Repository
import Usecase

extension AppPromiseCreateEventRepository: Repository.AppPromiseCreateEventCreatable {

    public func create(_ event: Entity.AppPromise.CreateEvent) async throws {
        try await create(event, on: db)
    }

    func create(_ event: Entity.AppPromise.CreateEvent, on db: Database) async throws {
    }
}
