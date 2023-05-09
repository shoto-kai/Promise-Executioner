export class TaskCreateModalState {
  static readonly init = new TaskCreateModalState("", "", false);

  constructor(
    readonly title: string,
    readonly note: string,
    readonly isOpenCreateSendUserMessagePenaltyModal: boolean
  ) {}

  patch(content: { title?: string; note?: string }): TaskCreateModalState {
    return new TaskCreateModalState(
      content.title == null ? this.title : content.title,
      content.note == null ? this.note : content.note,
      this.isOpenCreateSendUserMessagePenaltyModal
    );
  }

  get createSendUserMessagePenaltyModalOpened(): TaskCreateModalState {
    return new TaskCreateModalState(this.title, this.note, true);
  }

  get createSendUserMessagePenaltyModalClosed(): TaskCreateModalState {
    return new TaskCreateModalState(this.title, this.note, false);
  }
}
