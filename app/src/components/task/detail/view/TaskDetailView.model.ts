import { TaskDetailViewProps as Props } from "~/components/task/detail/view/TaskDetailView.props";
import { TaskDetailViewState as State } from "~/components/task/detail/view/TaskDetailView.state";
import { TaskDetailContentProps } from "~/components/task/detail/content/TaskDetailContent.props";

export class TaskDetailViewModel {
  constructor(
    private readonly props: Props,
    private readonly state: State,
    private readonly setState: (s: State) => void
  ) {}

  get contentProps(): TaskDetailContentProps {
    return this.props;
  }

  get title(): string {
    return this.props.task.title;
  }

  readonly edit = () => {
    console.log("編集");
  };
}
