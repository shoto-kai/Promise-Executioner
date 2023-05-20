import { AppTask } from "~/models/task/task";

export interface TaskFormProps {
  task: AppTask;
  setTask: (task: AppTask) => void;
}
