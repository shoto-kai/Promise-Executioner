import { AppTask } from "~/models/task/task";

export class TaskCreateModalState {
  static readonly init = new TaskCreateModalState(AppTask.init());

  constructor(readonly task: AppTask) {}
}
