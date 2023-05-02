import {
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import React, { FC } from "react";
import NotificationView from "~/components/notification/NotificationView";
import { Notification } from "~/models/notification/notification";
import { User } from "~/models/user/user";
import { AnotherUser } from "~/models/user/anotherUser";

const NotificationPage: FC = () => {
  const notifications = [
    new Notification(
      "67298399-FBA0-4D6A-9B43-C31FB57B3460",
      "gift",
      "田中からペナルティのプレゼントが届きました",
      new Date("2021-10-10T00:00:00.000Z"),
      false,
      new AnotherUser(
        new User("CFAB3E6E-BDCB-4E99-BE4F-717E74E9A881", "田中"),
        true
      )
    ),
    new Notification(
      "C200B3AB-CC17-4F58-8D61-093ABB80FFA9",
      "penalty",
      "中田からペナルティのプレゼントが届きました",
      new Date("2021-10-10T00:00:00.000Z"),
      false,
      new AnotherUser(
        new User("F7EA3CCB-A423-4A57-BF12-01369DBD0590", "中田"),
        true
      )
    ),
    new Notification(
      "A2A6F8D3-B51E-4F71-92FA-E454FDFFF2FB",
      "sign",
      "ペナルティが発生し、中田に送られました。",
      new Date("2021-10-09T00:00:00.000Z"),
      true
    ),
    new Notification(
      "EDCE2122-A9F0-4223-AA72-DE2F86F161B7",
      "penalty",
      "田中からペナルティのプレゼントが届きました",
      new Date("2021-10-07T00:00:00.000Z"),
      true
    ),
    new Notification(
      "BD0BFEFF-5973-4648-9C0E-2768910A26AD",
      "gift",
      "田中からペナルティのプレゼントが届きました",
      new Date("2021-10-05T23:00:00.000Z"),
      true
    ),
  ];
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Notification</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Notification</IonTitle>
          </IonToolbar>
        </IonHeader>
        <NotificationView notifications={notifications} />
      </IonContent>
    </IonPage>
  );
};

export default NotificationPage;
