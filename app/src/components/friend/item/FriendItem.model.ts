import { star, starOutline } from "ionicons/icons";
import FriendItemState from "./FriendItem.state";
import FriendItemProps from "./FriendItem.props";

export default class FriendItemModel {
  constructor(
    readonly props: FriendItemProps,
    readonly state: FriendItemState,
    readonly setState: (state: FriendItemState) => void
  ) {}

  get username(): string {
    return this.props.friend.name;
  }

  get icon(): string {
    return this.state.isFavorite ? star : starOutline;
  }

  readonly onClickStarIcon = (): void => {
    this.setState(this.state.toggleIsFavorite);
  };
}
