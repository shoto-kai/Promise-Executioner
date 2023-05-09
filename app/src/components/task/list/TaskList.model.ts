import { TaskListProps } from "~/components/task/list/TaskList.props";
import { TaskListState } from "~/components/task/list/TaskList.state";
import { TaskItemProps } from "~/components/task/list/item/TaskItem.props";

export class TaskListModel {
  constructor(
    props: TaskListProps,
    state: TaskListState,
    setState: (s: TaskListState) => void
  ) {}

  readonly onClick = () => {
    console.log("TaskListModel.onClick");
  };

  readonly items: readonly TaskItemProps[] = [
    { id: "1" },
    { id: "2" },
    { id: "3" },
    { id: "4" },
    { id: "5" },
    { id: "6" },
  ];
}
