import { TaskCreateModalProps } from "~/components/task/create/modal/TaskCreateModal.props";
import { TaskCreateModalState } from "~/components/task/create/modal/TaskCreateModal.state";

export class TaskCreateModalModel {
  constructor(
    public readonly props: TaskCreateModalProps,
    public readonly state: TaskCreateModalState,
    public readonly setState: (s: TaskCreateModalState) => void
  ) {}

  /** タスク名 */
  readonly title = "タスク名";

  /** 備考 */
  readonly note = "備考";

  get isOpen(): boolean {
    console.log("TaskCreateModalModel.isOpen", this.props.isOpen);
    return this.props.isOpen;
  }

  /** 作成処理 */
  readonly onCreate = () => this.props.onCreate();

  /** キャルセル処理 */
  readonly onCancel = () => this.props.onCancel();

  readonly onCreatePenalty = () => {
    console.log("TaskCreateModalModel.onCreatePenalty");
  };

  readonly onCreateRestriction = () => {
    console.log("TaskCreateModalModel.onCreateRestriction");
  };
}
