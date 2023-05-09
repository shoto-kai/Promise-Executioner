import { TaskCreateButtonProps } from "~/components/task/create/button/TaskCreateButton.props";

export class TaskCreateButtonModel {
  constructor(props: TaskCreateButtonProps) {}
  readonly onClick = () => {
    console.log("TaskCreateButtonModel.onClick");
  };
}
