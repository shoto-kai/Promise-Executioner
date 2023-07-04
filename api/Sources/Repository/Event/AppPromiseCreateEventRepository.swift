import Entity
import Usecase

public protocol AppPromiseCreateEventCreatable {
    func create(_ event: AppPromise.CreateEvent) async throws
}
