public enum NotificationKind: Hashable, Codable {
    case gift(task: AppPromise)
    case penalty(task: AppPromise)
    case sign(task: AppPromise)
    case terminate(task: AppPromise)
}
