import { TaskCreateModalProps } from "~/components/task/create/modal/TaskCreateModal.props";
import { TaskCreateModalState } from "~/components/task/create/modal/TaskCreateModal.state";
import { ChangeEvent } from "react";
import { CreateSendUserMessagePenaltyModalProps } from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal.props";

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
    return this.props.isOpen;
  }

  /** 作成処理 */
  readonly onCreate = () => this.props.onCreate();

  /** キャルセル処理 */
  readonly onCancel = () => this.props.onCancel();

  readonly onChangeTitle = (event: ChangeEvent<HTMLInputElement>) => {
    this.setState(this.state.patch({ title: event.target.value }));
  };

  readonly onChangeNote = (event: ChangeEvent<HTMLInputElement>) => {
    this.setState(this.state.patch({ note: event.target.value }));
  };

  get createSendUserMessagePenaltyModalProps(): CreateSendUserMessagePenaltyModalProps {
    return {
      isOpen: this.state.isOpenCreateSendUserMessagePenaltyModal,
      onCreate: this.onCloseCreateSendUserMessagePenaltyModal,
      onCancel: this.onCloseCreateSendUserMessagePenaltyModal,
    };
  }

  readonly onOpenCreateSendUserMessagePenaltyModal = (): void => {
    this.setState(this.state.createSendUserMessagePenaltyModalOpened);
  };

  readonly onCloseCreateSendUserMessagePenaltyModal = (): void => {
    this.setState(this.state.createSendUserMessagePenaltyModalClosed);
  };

  readonly onCreatePenalty = () => {
    console.log("TaskCreateModalModel.onCreatePenalty");
  };

  readonly onCreateRestriction = () => {
    console.log("TaskCreateModalModel.onCreateRestriction");
  };
}
