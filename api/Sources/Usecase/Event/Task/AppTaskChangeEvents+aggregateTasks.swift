import Entity
import Foundation

extension [AppTaskChangeEvent] {

    /// イベントからタスクを導出する
    public func aggregateTasks() -> [AppTask] {
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

extension [AppTask] {

    fileprivate func create(event: AppTaskCreateEvent) -> Self {
        guard first(where: { $0.id == event.task.id }) == nil else {
            return self
        }
        return self + [event.task]
    }

    fileprivate func update(event: AppTaskUpdateEvent) -> Self {
        guard let index = firstIndex(where: { $0.id == event.task.id }) else {
            return self
        }
        var copy = self
        copy[index] = event.task
        return copy
    }

    fileprivate func delete(event: AppTaskDeleteEvent) -> Self {
        filter { $0.id != event.taskID }
    }
}
