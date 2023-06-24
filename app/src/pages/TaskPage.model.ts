import { AppTask, AppTaskState } from "~/models/task/task";
import { TaskViewProps } from "~/components/task/TaskView.props";
import { TaskLimitDate } from "~/models/task/limit/TaskLimitDate";

export class TaskPageModel {
  private readonly tasks: readonly AppTask[] = [
    new AppTask(
      "1",
      "タスク1",
      "タスク1の備考",
      1000,
      AppTaskState.incomplete,
      new TaskLimitDate(new Date("2023-06-24T17:30:00+09:00"))
    ),
    new AppTask(
      "2",
      "タスク2",
      "タスク2の備考",
      2000,
      AppTaskState.incomplete,
      new TaskLimitDate(new Date("2023-06-24T20:00:00+09:00"))
    ),
    new AppTask(
      "3",
      "タスク3",
      "タスク3の備考",
      3000,
      AppTaskState.incomplete,
      new TaskLimitDate(new Date("2023-06-25T15:00:00+09:00"))
    ),
  ];

  readonly taskViewProps: TaskViewProps = {
    tasks: this.tasks,
  };
}
