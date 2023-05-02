import React, { FC } from "react";
import { IonList } from "@ionic/react";
import { Notification } from "~/models/notification/notification";
import NotificationItem from "~/components/notification/NotificationItem";

interface Props {
  notifications: readonly Notification[];
}

const FriendList: FC<Props> = ({ notifications }) => {
  return (
    <IonList inset={true}>
      {notifications.map((notification) => (
        <NotificationItem key={notification.id} notification={notification} />
      ))}
    </IonList>
  );
};

export default FriendList;
