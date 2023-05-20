export class SignViewState {
  static readonly init = new SignViewState(false);

  constructor(readonly isOpenCreateTaskModal: boolean) {}

  get createTaskModalOpened(): SignViewState {
    return new SignViewState(true);
  }

  get createTaskModalClosed(): SignViewState {
    return new SignViewState(false);
  }
}
