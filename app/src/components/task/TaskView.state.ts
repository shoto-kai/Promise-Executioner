export class TaskViewState {
  static readonly init = new TaskViewState(false);

  constructor(readonly isOpenCreateTaskModal: boolean) {}

  get createTaskModalOpened(): TaskViewState {
    return new TaskViewState(true);
  }

  get createTaskModalClosed(): TaskViewState {
    return new TaskViewState(false);
  }
}
