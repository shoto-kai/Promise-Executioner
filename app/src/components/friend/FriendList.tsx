import React, { FC } from "react";
import { IonList } from "@ionic/react";
import { AnotherUser } from "~/models/user/anotherUser";
import FriendItem from "~/components/friend/FriendItem";

interface Props {
  friends: readonly AnotherUser[];
}

const FriendList: FC<Props> = ({ friends }) => {
  return (
    <IonList inset={true}>
      {friends.map((friend) => (
        <FriendItem key={friend.id} friend={friend} />
      ))}
    </IonList>
  );
};

export default FriendList;
