import { TaskDetailViewProps as Props } from "~/components/task/detail/view/TaskDetailView.props";
import { TaskDetailViewState as State } from "~/components/task/detail/view/TaskDetailView.state";
import { AppTask } from "~/models/task/task";

export class TaskDetailContentModel {
  constructor(
    private readonly props: Props,
    private readonly state: State,
    private readonly setState: (s: State) => void
  ) {}

  get title(): string {
    return this.task.title;
  }

  get amount(): number {
    return this.task.amount;
  }

  get note(): string {
    return this.task.note;
  }

  private get task(): AppTask {
    return this.props.task;
  }
}
