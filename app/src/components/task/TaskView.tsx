import TaskList from "~/components/task/TaskList";
import { FC } from "react";
import { Task } from "~/models/task/task";

interface Props {
  tasks: readonly Task[];
}

const TaskView: FC<Props> = ({ tasks }) => {
  return (
    <div>
      <TaskList tasks={tasks} />
    </div>
  );
};

export default TaskView;
