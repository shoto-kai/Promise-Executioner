import Entity
import Foundation

extension [AppTaskChangeEvent] {
    public func aggregateTasks() -> [AppPromise] {
        sorted().reduce([]) { (tasks, changeEvent) in
            switch changeEvent {
            case .create(let event):
                return tasks.create(event: event)
            case .update(let event):
                return tasks.update(event: event)
            case .delete(let event):
                return tasks.delete(event: event)
            }
        }
    }
}

extension [AppPromise] {

    fileprivate func create(event: AppPromise.CreateEvent) -> Self {
        guard first(where: { $0.id == event.promise.id }) == nil else {
            return self
        }
        return self + [event.promise]
    }

    fileprivate func update(event: AppPromise.UpdateEvent) -> Self {
        guard let index = firstIndex(where: { $0.id == event.promise.id }) else {
            return self
        }
        var copy = self
        copy[index] = event.promise
        return copy
    }

    fileprivate func delete(event: AppPromise.DeleteEvent) -> Self {
        filter { $0.id != event.promiseID }
    }
}
