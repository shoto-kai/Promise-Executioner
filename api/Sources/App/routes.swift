import Entity
import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    //    try app.group("auth") { auth in
    //        try auth.register(collection: FirebaseAuthController())
    //        try auth.register(collection: SessionAuthController())
    //    }

    let api = app.grouped("api")
    //        .grouped(BearerAuthMiddleware())
    //        .grouped(User.guardMiddleware())

    //    try api.register(collection: TaskController())
}
