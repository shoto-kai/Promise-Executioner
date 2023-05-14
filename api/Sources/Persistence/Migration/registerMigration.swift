import Fluent

public func registerMigration(_ migrations: Migrations) {
    migrations.add(User.Migration())
    migrations.add(PairNotification.Migration())
    migrations.add(AppTask.Migration())
    migrations.add(SendMessageToUserPenalty.Migration())
    migrations.add(PushCondition.Migration())
    migrations.add(PushCondition.DeadlineRestriction.Migration())
}
