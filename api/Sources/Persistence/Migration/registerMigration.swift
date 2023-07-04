import Entity
import Fluent

public func registerMigration(_ migrations: Migrations) {
    migrations.add(User.Migration())

    migrations.add(FirebaseUser.Migration())

    migrations.add(BearerAuth.Migration())

    migrations.add(AppPromise.Migration())
    migrations.add(PushTask.Migration())
    migrations.add(PushTask.DeadlineRestriction.Migration())
    migrations.add(SendUserMessagePenalty.Migration())

    migrations.add(AppPromiseCreateEvent.Migration())
    migrations.add(AppPromiseUpdateEvent.Migration())
    migrations.add(AppPromiseDeleteEvent.Migration())

    migrations.add(AppPromiseFulfillEvent.Migration())
    migrations.add(AppPromiseBreakEvent.Migration())
}
