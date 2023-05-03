import Foundation
import Entity

public let sendUserPenalties: [SendUserPenalty] = [
    .init(
        id: .init(UUID()),
        destination: users[0],
        overview: "PayPay500円分",
        note: "メモ",
        content: "https://paypay.com",
        executedAt: Date(timeIntervalSince1970: 0)
    ),
    .init(
        id: .init(UUID()),
        destination: users[1],
        overview: "LINEPay100円分",
        note: "メモ",
        content: "https://line.com",
        executedAt: Date(timeIntervalSince1970: 24 * 60 * 60)
    ),
    .init(
        id: .init(UUID()),
        destination: users[2],
        overview: "りんごカード",
        note: "メモ",
        content: "https://apple.com",
        executedAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60)
    ),
]
