import Foundation
import Entity

public let appTasks: [AppTask] = [
    .init(
        id: .init(UUID()),
        title: "集合時間",
        note: "BBQ: 10時から",
        restrictions: restrictionsList[0],
        penalties: penaltiesList[0]
    ),
    .init(
        id: .init(UUID()),
        title: "早起き",
        note: "6時に起きる",
        restrictions: restrictionsList[1],
        penalties: penaltiesList[1]
    ),
    .init(
        id: .init(UUID()),
        title: "帰宅時間",
        note: "16時に帰る",
        restrictions: restrictionsList[2],
        penalties: penaltiesList[2]
    ),
]
