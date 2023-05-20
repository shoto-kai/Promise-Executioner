import { IonContent, IonPage } from "@ionic/react";
import React, { FC } from "react";
import SignView from "~/components/sign/SignView";
import { FirebaseAuthService } from "~/services/auth/firebaseAuthService";
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";

const SignPage: FC = () => {
  const firebaseConfig = {
    apiKey: import.meta.env.VITE_FIREBASE_API_KEY,
    authDomain: import.meta.env.VITE_AUTH_DOMAIN,
    projectId: import.meta.env.VITE_PROJECT_ID,
    storageBucket: import.meta.env.VITE_STORAGE_BUCKET,
    messagingSenderId: import.meta.env.VITE_MESSAGING_SENDER_ID,
    appId: import.meta.env.VITE_APP_ID,
    measurementId: import.meta.env.VITE_MEASUREMENT_ID,
  };
  console.log(firebaseConfig);

  const app = initializeApp(firebaseConfig);
  const auth = getAuth(app);
  const authService = new FirebaseAuthService(auth);
  return (
    <IonPage>
      <IonContent fullscreen>
        <SignView props={{ authService }} />
      </IonContent>
    </IonPage>
  );
};

export default SignPage;
