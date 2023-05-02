import {
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import React, { FC } from "react";
import FriendView from "~/components/friend/FriendView";
import { User } from "~/models/user/user";
import { AnotherUser } from "~/models/user/anotherUser";

const FriendPage: FC = () => {
  const users = [
    new AnotherUser(
      new User("21580B73-CB9C-484B-B1F4-FB2C411CC194", "John"),
      true
    ),
    new AnotherUser(
      new User("DB535BA7-5E8A-435B-B7E7-216195BC2A98", "Bob"),
      true
    ),
    new AnotherUser(
      new User("35AC49C8-7481-437A-BB89-A6AF164BD6F1", "Alice"),
      true
    ),
    new AnotherUser(
      new User("122B83F3-71E4-425D-B479-CFDA735AB87A", "Donald"),
      true
    ),
  ];
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Friend</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Friend</IonTitle>
          </IonToolbar>
        </IonHeader>
        <FriendView friends={users} />
      </IonContent>
    </IonPage>
  );
};

export default FriendPage;
