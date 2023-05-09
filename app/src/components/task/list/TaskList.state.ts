export class TaskListState {
  static readonly init = new TaskListState(new Date());

  constructor(readonly now: Date) {}

  readonly setNow = (now: Date): TaskListState => {
    return new TaskListState(now);
  };
}
