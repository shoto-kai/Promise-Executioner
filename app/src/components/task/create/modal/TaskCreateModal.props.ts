import { AppTask } from "~/models/task/task";

export interface TaskCreateModalProps {
  isOpen: boolean;
  onCreate: (task: AppTask) => void;
  onCancel: () => void;
}
