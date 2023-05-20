import { TaskListProps } from "~/components/task/list/TaskList.props";
import { TaskListState } from "~/components/task/list/TaskList.state";
import { TaskItemProps } from "~/components/task/list/item/TaskItem.props";
import { TaskDetailViewProps } from "~/components/task/detail/view/TaskDetailView.props";

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

  get items(): readonly (TaskItemProps & TaskDetailViewProps)[] {
    return this.props.tasks.map((task) => ({
      task,
      now: this.state.now,
    }));
  }
}
