import Foundation
import Entity

public let penaltiesList: [Penalties] = [
    .init(sendUserPenalties: []),
    .init(sendUserPenalties: [sendUserPenalties[0]]),
    .init(sendUserPenalties: Array(sendUserPenalties[1...2])),
]
