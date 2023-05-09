import { TaskItemProps } from "~/components/task/list/item/TaskItem.props";
import { TaskItemState } from "~/components/task/list/item/TaskItem.state";

export class TaskItemModel {
  constructor(
    props: TaskItemProps,
    state: TaskItemState,
    setState: (s: TaskItemState) => void
  ) {}

  readonly title = "タスク名";

  readonly price = 500;

  readonly restTime = "3時間20分";

  readonly onClick = () => {
    console.log("TaskItemModel.onClick");
  };
}
