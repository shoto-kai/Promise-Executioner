//import Foundation
//import Fluent
//import Entity
//
//extension PushCondition {
//    final class DeadlineRestriction: Model {
//        
//        static let schema = "push_button_condition_deadline_restriction"
//        
//        @ID(key: .id)
//        var id: UUID?
//        
//        @Parent(key: "push_condition_id")
//        var condition: PushCondition
//        
//        @Field(key: "deadline")
//        var deadline: Date
//        
//        @Timestamp(key: "created_at", on: .create)
//        var createdAt: Date?
//        
//        @Timestamp(key: "updated_at", on: .update)
//        var updatedAt: Date?
//        
//        init() { }
//        
//        init(
//            id: UUID? = nil,
//            conditionID: PushCondition.IDValue,
//            deadline: Date
//        ) {
//            self.id = id
//            self.$condition.id = conditionID
//            self.deadline = deadline
//        }
//    }
//}
//
//extension Entity.PushCondition.Restriction {
//    func toDeadlineModel(
//        of conditionID: Entity.PushCondition.ID
//    ) -> PushCondition.DeadlineRestriction? {
//        guard case .deadline(let deadline) = self else {
//            return nil
//        }
//        return .init(
//            conditionID: conditionID.value,
//            deadline: deadline
//        )
//    }
//}
//
//extension PushCondition.DeadlineRestriction {
//    var toEntity: Entity.PushCondition.Restriction {
//        .deadline(at: deadline)
//    }
//}
