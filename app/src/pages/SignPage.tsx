import { IonContent, IonPage } from "@ionic/react";
import React, { FC } from "react";
import SignView from "~/components/sign/SignView";

const SignPage: FC = () => {
  return (
    <IonPage>
      <IonContent fullscreen>
        <SignView props={{}} />
      </IonContent>
    </IonPage>
  );
};

export default SignPage;
