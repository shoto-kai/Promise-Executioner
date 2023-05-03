@testable import Entity
import XCTest

public final class SendUserPenaltyTests: XCTestCase {
    
    public static let values: [SendUserPenalty] = [
        .init(
            id: .init(UUID()),
            destination: UserTests.values[0],
            overview: "PayPay500円分",
            note: "メモ",
            content: "https://paypay.com",
            executedAt: Date(timeIntervalSince1970: 0)
        ),
        .init(
            id: .init(UUID()),
            destination: UserTests.values[1],
            overview: "LINEPay100円分",
            note: "メモ",
            content: "https://line.com",
            executedAt: Date(timeIntervalSince1970: 24 * 60 * 60)
        ),
        .init(
            id: .init(UUID()),
            destination: UserTests.values[2],
            overview: "りんごカード",
            note: "メモ",
            content: "https://apple.com",
            executedAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60)
        ),
    ]
}
