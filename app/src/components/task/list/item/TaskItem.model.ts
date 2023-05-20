import { TaskItemProps } from "~/components/task/list/item/TaskItem.props";
import { TaskItemState } from "~/components/task/list/item/TaskItem.state";

export class TaskItemModel {
  constructor(
    private readonly props: TaskItemProps,
    private readonly state: TaskItemState,
    private readonly setState: (s: TaskItemState) => void
  ) {}

  get title(): string {
    return this.props.task.title;
  }

  get amount(): number {
    return this.props.task.amount;
  }

  get restTime(): string {
    return this.props.task.restTime(this.now);
  }

  readonly onClick = () => {
    console.log("TaskItemModel.onClick");
  };

  private get now(): Date {
    return this.props.now;
  }
}
