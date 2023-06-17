import Fluent
import FluentPostgresDriver
import Persistence
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(
        .postgres(
            hostname: Environment.get("DATABASE_HOST") ?? "localhost",
            port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:))
                ?? PostgresConfiguration.ianaPortNumber,
            username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
            password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
            database: Environment.get("DATABASE_NAME") ?? "vapor_database"
        ), as: .psql)

    registerMigration(app.migrations)

    app.logger.info("env: \(app.environment.name)")

    if app.environment == .production {
        app.sessions.configuration.cookieFactory = { sessionID in
            let domain = Environment.get("API_SERVER_HOST")
            app.logger.info("cookie domain:　\(String(describing: domain))")
            return .init(
                string: sessionID.string,
                expires: Date(timeIntervalSinceNow: 60 * 60 * 24 * 30),  // 1ヶ月
                maxAge: nil,
                domain: domain,
                path: "/auth/session",
                isSecure: true,
                isHTTPOnly: true,
                sameSite: .lax
            )
        }
    }
    app.middleware.use(app.sessions.middleware)

    // register routes
    try routes(app)
}
