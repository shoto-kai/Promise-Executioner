import Foundation

public struct SendUserPenalty: Hashable, Codable, Identifiable {
    
    public typealias ID = Identifier<SendUserPenalty>
    
    public var id: ID
    
    /// 送り先ユーザー
    public var destination: User
    
    /// ペナルティで送るものの概要
    public var overview: String
    
    /// メモ
    public var note: String
    
    /// 送信する内容
    public var content: String
    
    /// 執行日時
    public var executedAt: Date?
    
    public init(
        id: ID,
        destination: User,
        overview: String,
        note: String,
        content: String,
        executedAt: Date? = nil
    ) {
        self.id = id
        self.destination = destination
        self.overview = overview
        self.note = note
        self.content = content
        self.executedAt = executedAt
    }
    
}
