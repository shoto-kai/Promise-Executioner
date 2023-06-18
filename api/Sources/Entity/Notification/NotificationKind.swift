public enum NotificationKind: Hashable, Codable {
    case gift(task: AppTask)
    case penalty(task: AppTask)
    case sign(task: AppTask)
    case terminate(task: AppTask)
}
