import TaskList from "~/components/task/list/TaskList";
import TaskCreateButton from "~/components/task/create/button/TaskCreateButton";
import { useState, useMemo } from "react";
import TaskCreateModal from "~/components/task/create/modal/TaskCreateModal";
import { TaskViewModel as Model } from "~/components/task/TaskView.model";
import { TaskViewState as State } from "~/components/task/TaskView.state";
import { TaskViewProps as Props } from "~/components/task/TaskView.props";

export default function TaskView({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(() => new Model(props, state, setState), [props, state]);
  return (
    <>
      <TaskList props={m.taskListProps} />
      <TaskCreateButton onClick={m.onOpenCreateTaskModal} />
      <TaskCreateModal props={m.taskCreateModalProps} />
    </>
  );
}
