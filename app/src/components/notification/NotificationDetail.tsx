import React, { FC } from "react";
import {
  IonBackButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import { Notification } from "~/models/notification/notification";

interface Props {
  notification: Notification;
}

const NotificationDetail: FC<Props> = ({ notification }) => {
  return (
    <>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonBackButton></IonBackButton>
          </IonButtons>
          <IonTitle>{notification.title}</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent class="ion-padding">
        <h1>{notification.title}</h1>
      </IonContent>
    </>
  );
};

export default NotificationDetail;
