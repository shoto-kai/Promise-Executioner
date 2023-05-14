import Entity

/// 押下課題をIDで探す
public protocol PushConditionFindable {
    func find(_ id: PushCondition.ID) async throws -> PushCondition?
}

/// タスクの押下課題一覧を取得する
public protocol AllPushConditionTakeable {
    func takeAll(of: AppTask.ID) async throws -> [PushCondition]
}

/// 押下課題を作成する
public protocol PushConditionCreatable {
    func create(_ condition: PushCondition, of: AppTask.ID) async throws
}

/// 押下課題を更新する
public protocol PushConditionUpdatable {
    func update(_ condition: PushCondition) async throws
}

/// 押下課題を削除する
public protocol PushConditionDeletable {
    func delete(_ id: PushCondition.ID) async throws
}
