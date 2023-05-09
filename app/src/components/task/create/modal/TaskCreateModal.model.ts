import { TaskCreateModalProps } from "~/components/task/create/modal/TaskCreateModal.props";
import { TaskCreateModalState } from "~/components/task/create/modal/TaskCreateModal.state";
import { ChangeEvent } from "react";
import { CreateSendUserMessagePenaltyModalProps } from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal.props";
import { LocationRestriction } from "~/models/task/penalty/location/LocationRestriction";
import { CreateLocationRestrictionModalProps } from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal.props";

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
      onCreate: this.onCreatePenalty,
      onCancel: this.onCloseModal,
    };
  }

  get createLocationRestrictionModalProps(): CreateLocationRestrictionModalProps {
    return {
      isOpen: this.state.isOpenCreateLocationRestrictionModal,
      onCreate: this.onCreateRestriction,
      onCancel: this.onCloseModal,
    };
  }

  readonly onOpenCreateSendUserMessagePenaltyModal = (): void => {
    this.setState(this.state.createSendUserMessagePenaltyModalOpened);
  };

  readonly onOpenCreateLocationRestrictionModal = (): void => {
    this.setState(this.state.createLocationRestrictionModalOpened);
  };

  readonly onCreatePenalty = () => {
    console.log("TaskCreateModalModel.onCreatePenalty");
    this.onCloseModal();
  };

  readonly onCreateRestriction = (restriction: LocationRestriction) => {
    console.log("TaskCreateModalModel.onCreateRestriction", restriction);
    this.onCloseModal();
  };

  private readonly onCloseModal = () => this.setState(this.state.modalClosed);
}
