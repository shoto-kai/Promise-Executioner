import Fluent

public func registerMigration(_ migrations: Migrations) {
    migrations.add(User.Migration())
    migrations.add(Friend.Migration())
}
