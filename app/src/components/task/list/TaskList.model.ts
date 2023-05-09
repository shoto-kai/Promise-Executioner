import { TaskListProps } from "~/components/task/list/TaskList.props";
import { TaskListState } from "~/components/task/list/TaskList.state";
import { TaskItemProps } from "~/components/task/list/item/TaskItem.props";

export class TaskListModel {
  constructor(
    private readonly props: TaskListProps,
    private readonly state: TaskListState,
    private readonly setState: (s: TaskListState) => void
  ) {}

  readonly onClick = () => {
    console.log("TaskListModel.onClick");
  };

  readonly setNow = (now: Date = new Date()) => {
    this.setState(this.state.setNow(now));
  };

  get items(): readonly TaskItemProps[] {
    return [
      { id: "1", now: this.state.now },
      { id: "2", now: this.state.now },
      { id: "3", now: this.state.now },
      { id: "4", now: this.state.now },
      { id: "5", now: this.state.now },
      { id: "6", now: this.state.now },
    ];
  }
}
