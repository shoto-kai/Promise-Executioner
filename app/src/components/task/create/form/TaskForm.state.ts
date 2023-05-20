export class TaskFormState {
  static readonly init = new TaskFormState("", "", false, false);

  constructor(
    readonly title: string,
    readonly note: string,
    readonly isOpenCreateSendUserMessagePenaltyModal: boolean,
    readonly isOpenCreateLocationRestrictionModal: boolean
  ) {}

  patch(content: { title?: string; note?: string }): TaskFormState {
    return new TaskFormState(
      content.title == null ? this.title : content.title,
      content.note == null ? this.note : content.note,
      this.isOpenCreateSendUserMessagePenaltyModal,
      this.isOpenCreateLocationRestrictionModal
    );
  }

  get createSendUserMessagePenaltyModalOpened(): TaskFormState {
    return new TaskFormState(this.title, this.note, true, false);
  }

  get createLocationRestrictionModalOpened(): TaskFormState {
    return new TaskFormState(this.title, this.note, false, true);
  }

  get modalClosed(): TaskFormState {
    return new TaskFormState(this.title, this.note, false, false);
  }
}
