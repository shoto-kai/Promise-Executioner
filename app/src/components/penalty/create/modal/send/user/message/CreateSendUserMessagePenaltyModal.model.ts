import { CreateSendUserMessagePenaltyModalProps as Props } from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal.props";
import { CreateSendUserMessagePenaltyModalState as State } from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal.state";
import { ChangeEvent } from "react";

export class CreateSendUserMessagePenaltyModalModel {
  constructor(
    private readonly props: Props,
    private readonly state: State,
    private readonly setState: (state: State) => void
  ) {}

  get isOpen(): boolean {
    return this.props.isOpen;
  }

  readonly onCreate = () => this.props.onCreate();
  readonly onCancel = () => this.props.onCancel();

  readonly onChangeTitle = (event: ChangeEvent<HTMLInputElement>) => {
    this.setState(this.state.patch({ title: event.target.value }));
  };

  readonly onChangePrice = (event: ChangeEvent<HTMLInputElement>) => {
    const inputPrice = event.target.value;
    if (!Number.isInteger(inputPrice)) return;
    this.setState(this.state.patch({ price: Number(inputPrice) }));
  };

  readonly onChangeDestinedUsername = (
    event: ChangeEvent<HTMLInputElement>
  ) => {
    this.setState(this.state.patch({ destinedUsername: event.target.value }));
  };
}
