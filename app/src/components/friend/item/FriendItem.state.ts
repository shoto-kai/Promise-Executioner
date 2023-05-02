import FriendItemProps from "~/components/friend/item/FriendItem.props";

export default class FriendItemState {
  constructor(readonly isFavorite: boolean) {}

  static readonly init = (props: FriendItemProps) =>
    new FriendItemState(props.friend.isMyFriend);

  get toggleIsFavorite(): FriendItemState {
    return new FriendItemState(!this.isFavorite);
  }
}
