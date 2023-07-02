import Entity
import Usecase

/// タスク作成イベントを保存する
public protocol AppTaskCreateEventCreatable {
    func create(_ event: AppTaskCreateEvent) async throws
}

/// タスク作成イベントをユーザーで取得する
public protocol AppTaskCreateEventTakeableByUser {
    func takeAll(of: User.ID) async throws -> [AppTaskCreateEvent]
}

/// タスク作成イベントをタスクIDの配列で取得する
public protocol AppTaskCreateEventTakeableByTaskIDs {
    func takeAll(ids: [AppPromise.ID]) async throws -> [AppTaskCreateEvent]
}
