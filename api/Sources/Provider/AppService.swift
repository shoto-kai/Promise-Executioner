import ServiceApp
import ServiceProtocol
import Vapor

extension Request {

    public var allUserTaskTakeService: some AllUserTaskTakeable {
        AllUserTaskService(allTaskTakeable: allUserTaskTaker)
    }
    
    public var findTaskService: some TaskFindable {
        FindTaskService(taskFinder)
    }
    
    public var createTaskService: some TaskCreatable {
        CreateTaskService(taskCreator)
    }
    
    public var updateTaskService: some TaskUpdatable {
        UpdateTaskService(taskUpdator)
    }
    
    public var deleteTaskService: some TaskDeletable {
        DeleteTaskService(taskDeleter)
    }
}
