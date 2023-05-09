import { TaskItemProps } from "~/components/task/list/item/TaskItem.props";
import { TaskItemState } from "~/components/task/list/item/TaskItem.state";

export class TaskItemModel {
  constructor(
    private readonly props: TaskItemProps,
    private readonly state: TaskItemState,
    private readonly setState: (s: TaskItemState) => void
  ) {}

  readonly title = "タスク名";

  readonly price = 500;

  get restTime(): string {
    return `${this.now.getMinutes()}分${this.now.getSeconds()}秒`;
  }

  readonly onClick = () => {
    console.log("TaskItemModel.onClick");
  };

  private get now(): Date {
    return this.props.now;
  }
}
