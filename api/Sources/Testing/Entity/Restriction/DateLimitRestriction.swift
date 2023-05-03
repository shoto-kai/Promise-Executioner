import Foundation
import Entity

public let dateLimitRestrictions: [DateLimitRestriction] = [
    .init(id: .init(UUID()), limit: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)),
    .init(id: .init(UUID()), limit: Date(timeIntervalSince1970: 4 * 24 * 60 * 60), completedAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)),
    .init(id: .init(UUID()), limit: Date(timeIntervalSince1970: 5 * 24 * 60 * 60), completedAt: Date(timeIntervalSince1970: 4 * 24 * 60 * 60)),
]
