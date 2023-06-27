import XCTest
import Entity
import Testing

@testable import Usecase

final class AppTaskChangeEventsAggregateTasksTest: XCTestCase {
    
    func test集約できる() {
        
        var taskA = AppTask()
        taskA.title = "First"
        
        let createA = AppTaskCreateEvent(task: taskA, at: .init(at: 1))
        
        taskA.title = "Second"
        let updateA1 = AppTaskUpdateEvent(task: taskA, at: .init(at: 2))
        
        taskA.title = "Third"
        let updateA2 = AppTaskUpdateEvent(task: taskA, at: .init(at: 3))
        
        var taskB = AppTask()
        taskB.title = "1番目"
        
        let createB = AppTaskCreateEvent(task: taskB, at: .init(at: 2))
        
        taskB.title = "2番目"
        let updateB = AppTaskUpdateEvent(task: taskB, at: .init(at: 3))
        
        var taskC = AppTask()
        taskC.title = "One"
        
        let createC = AppTaskCreateEvent(task: taskC, at: .init(at: 3))
        
        let deleteC = AppTaskDeleteEvent(taskID: taskC.id, at: .init(at: 4))
        
        let events: [AppTaskChangeEvent] = [
            .delete(event: deleteC),
            .create(event: createC),
            .update(event: updateB),
            .create(event: createB),
            .update(event: updateA1),
            .update(event: updateA2),
            .create(event: createA),
        ]
        
        let expected: Set<AppTask> = [taskA, taskB]
        let actual = Set(events.aggregateTasks())
        XCTAssertEqual(actual, expected)
    }
}
