export class AppTaskState {
  private constructor(readonly state: "incomplete" | "completed" | "failed") {}

  static readonly incomplete = new AppTaskState("incomplete");
  static readonly completed = new AppTaskState("completed");
  static readonly failed = new AppTaskState("failed");
}

/** タスク */
export class AppTask {
  /**
   * @param id タスクUUID
   * @param title タイトル
   * @param note 備考
   * @param amount 代償金額
   * @param state タスク状態
   * @param limitDate 期限の日時
   */
  constructor(
    readonly id: string,
    readonly title: string,
    readonly note: string,
    readonly amount: number,
    readonly state: AppTaskState,
    readonly limitDate?: Date
  ) {}

  static init(id: string = crypto.randomUUID()): AppTask {
    return new AppTask(id, "", "", 0, AppTaskState.incomplete, undefined);
  }
}
