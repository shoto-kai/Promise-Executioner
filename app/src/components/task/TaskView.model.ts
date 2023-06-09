import { TaskViewState } from "~/components/task/TaskView.state";
import { TaskViewProps } from "~/components/task/TaskView.props";
import { TaskListProps } from "~/components/task/list/TaskList.props";
import { TaskCreateModalProps } from "~/components/task/create/modal/TaskCreateModal.props";

export class TaskViewModel {
  constructor(
    private readonly props: TaskViewProps,
    private readonly state: TaskViewState,
    private readonly setState: (s: TaskViewState) => void
  ) {}

  get taskListProps(): TaskListProps {
    return {
      tasks: this.props.tasks,
    };
  }

  get taskCreateModalProps(): TaskCreateModalProps {
    return {
      isOpen: this.state.isOpenCreateTaskModal,
      onCreate: () => this.onCloseCreateTaskModal(),
      onCancel: () => this.onCloseCreateTaskModal(),
    };
  }

  readonly onOpenCreateTaskModal = () => {
    this.setState(this.state.createTaskModalOpened);
    console.log("test");
  };

  private onCloseCreateTaskModal() {
    this.setState(this.state.createTaskModalClosed);
  }
}
