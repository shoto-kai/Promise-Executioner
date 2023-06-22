import Entity
import Presentation
import Provider
import Vapor

struct TaskController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let tasks = routes.grouped("task")
        tasks.get(use: all)
        tasks.post(use: create)
        tasks.put(use: update)
        
        let task = routes.grouped(":\(taskIDPath)")
        task.get(use: find)
        task.delete(use: delete)
    }
    
    func all(req: Request) async throws -> [Presentation.AppTask] {
        let user = try req.auth.require(User.self)
        return try await req.allUserTaskTakeService.takeAll(of: user.id)
            .map { $0.toContent }
    }
    
    func create(req: Request) async throws -> HTTPStatus {
        let user = try req.auth.require(User.self)
        let task = try req.content.decode(Presentation.AppTask.self)
        try await req.createTaskService.create(task: task.toEntity, of: user.id)
        return .created
    }
    
    func update(req: Request) async throws -> HTTPStatus {
        let task = try req.content.decode(Presentation.AppTask.self)
        try await req.updateTaskService.update(task: task.toEntity)
        return .ok
    }
    
    func find(req: Request) async throws -> Presentation.AppTask {
        guard let task = try await req.findTaskService.find(req.taskID) else {
            throw Abort(.notFound)
        }
        return task.toContent
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        try await req.deleteTaskService.delete(req.taskID)
        return .ok
    }
}

fileprivate let taskIDPath = "taskID"

fileprivate extension Request {
    var taskID: Entity.AppTask.ID {
        get throws {
            guard let uuid = parameters.get(taskIDPath, as: UUID.self) else {
                throw Abort(.badRequest)
            }
            return .init(uuid)
        }
    }
}
