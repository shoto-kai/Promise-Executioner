import Foundation

public enum NotificationReadState: Hashable, Codable {
    case read(at: Date)
    case unread
}
