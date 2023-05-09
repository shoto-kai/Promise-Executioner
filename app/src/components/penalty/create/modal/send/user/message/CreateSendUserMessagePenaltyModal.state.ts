export class CreateSendUserMessagePenaltyModalState {
  static readonly init = new CreateSendUserMessagePenaltyModalState("", 0, "");

  constructor(
    readonly title: string,
    readonly price: number,
    readonly destinedUsername: string
  ) {}

  patch(content: {
    title?: string;
    price?: number;
    destinedUsername?: string;
  }): CreateSendUserMessagePenaltyModalState {
    return new CreateSendUserMessagePenaltyModalState(
      content.title == null ? this.title : content.title,
      content.price == null ? this.price : content.price,
      content.destinedUsername == null
        ? this.destinedUsername
        : content.destinedUsername
    );
  }
}
