import {
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import React, { FC } from "react";
import SignView from "~/components/sign/SignView";

const SignPage: FC = () => {
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Sign</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Sign</IonTitle>
          </IonToolbar>
        </IonHeader>
        <SignView props={{}} />
      </IonContent>
    </IonPage>
  );
};

export default SignPage;
