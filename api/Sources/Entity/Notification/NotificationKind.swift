public enum NotificationKind: Hashable, Codable {
    case gift(promise: AppPromise)
    case penalty(promise: AppPromise)
    case sign(promise: AppPromise)
    case terminate(promise: AppPromise)
}
