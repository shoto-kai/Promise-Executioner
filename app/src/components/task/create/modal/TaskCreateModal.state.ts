export class TaskCreateModalState {
  static readonly init = new TaskCreateModalState("", "", false, false);

  constructor(
    readonly title: string,
    readonly note: string,
    readonly isOpenCreateSendUserMessagePenaltyModal: boolean,
    readonly isOpenCreateLocationRestrictionModal: boolean
  ) {}

  patch(content: { title?: string; note?: string }): TaskCreateModalState {
    return new TaskCreateModalState(
      content.title == null ? this.title : content.title,
      content.note == null ? this.note : content.note,
      this.isOpenCreateSendUserMessagePenaltyModal,
      this.isOpenCreateLocationRestrictionModal
    );
  }

  get createSendUserMessagePenaltyModalOpened(): TaskCreateModalState {
    return new TaskCreateModalState(this.title, this.note, true, false);
  }

  get createLocationRestrictionModalOpened(): TaskCreateModalState {
    return new TaskCreateModalState(this.title, this.note, false, true);
  }

  get modalClosed(): TaskCreateModalState {
    return new TaskCreateModalState(this.title, this.note, false, false);
  }
}
