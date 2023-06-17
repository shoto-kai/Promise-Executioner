import Foundation

extension Date {
    public init(at days: Int) {
        self.init(timeIntervalSince1970: TimeInterval(days * 24 * 60 * 60))
    }
}
