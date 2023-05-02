import FriendList from "~/components/friend/FriendList";
import { AnotherUser } from "~/models/user/anotherUser";
import { FC } from "react";

interface Props {
  friends: readonly AnotherUser[];
}
const FriendView: FC<Props> = ({ friends }) => {
  return <FriendList friends={friends} />;
};

export default FriendView;
