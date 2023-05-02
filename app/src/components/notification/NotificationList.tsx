import React, { FC } from "react";
import { IonList, IonNavLink } from "@ionic/react";
import { Notification } from "~/models/notification/notification";
import NotificationItem from "~/components/notification/NotificationItem";
import NotificationDetail from "~/components/notification/NotificationDetail";

interface Props {
  notifications: readonly Notification[];
}

const FriendList: FC<Props> = ({ notifications }) => {
  return (
    <IonList inset={true}>
      {notifications.map((notification) => (
        <IonNavLink
          routerDirection="forward"
          component={() => <NotificationDetail notification={notification} />}
          key={notification.id}
        >
          <NotificationItem notification={notification} />
        </IonNavLink>
      ))}
    </IonList>
  );
};

export default FriendList;
