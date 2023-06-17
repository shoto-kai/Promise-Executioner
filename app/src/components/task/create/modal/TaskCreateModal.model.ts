import { TaskCreateModalProps } from "~/components/task/create/modal/TaskCreateModal.props";
import { TaskCreateModalState } from "~/components/task/create/modal/TaskCreateModal.state";
import { TaskFormProps } from "~/components/task/create/form/TaskForm.props";
import { AppTask } from "~/models/task/task";

export class TaskCreateModalModel {
  constructor(
    public readonly props: TaskCreateModalProps,
    public readonly state: TaskCreateModalState,
    public readonly setState: (s: TaskCreateModalState) => void
  ) {}

  get isOpen(): boolean {
    return this.props.isOpen;
  }

  get content(): TaskFormProps {
    return {
      task: AppTask.init(),
      setTask: (task: AppTask) => {},
    };
  }

  /** 作成処理 */
  readonly onCreate = () => {
    console.log("作成");
  };

  /** キャルセル処理 */
  readonly onCancel = () => {
    console.log("キャンセル");
  };
}
