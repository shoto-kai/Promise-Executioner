import "./SignView.css";
import { useState, useMemo } from "react";
import {
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonIcon
} from "@ionic/react";
import { logoGithub, logoGoogle } from 'ionicons/icons';
import { SignViewState as State } from "~/components/sign/SignView.state";
import { SignViewProps as Props } from "~/components/sign/SignView.props";
import { SignViewModel as Model } from "~/components/sign/SignView.model";

export default function SignView({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(() => new Model(props, state, setState), [props, state]);
  return (
    <IonCard class="ion-align-items-center">
      <IonCard>
        <img alt="Silhouette of mountains" src="https://ionicframework.com/docs/img/demos/card-media.png" />
        <IonCardHeader>
          <IonCardTitle>アカウント登録/ログイン</IonCardTitle>
        </IonCardHeader>
        <IonCardContent class="sign-button">
          <IonButton color="dark" fill="outline" expand="block" onClick={m.logInByGitHub}>
            <IonIcon slot="start" icon={logoGoogle}></IonIcon>
            Googleでログイン
          </IonButton>
        </IonCardContent>
        <IonCardContent class="sign-button">
          <IonButton class="sign-button" color="dark" fill="outline" expand="block" onClick={m.logInByGoogle}>
            <IonIcon slot="start" icon={logoGithub}></IonIcon>
            GitHubでログイン
          </IonButton>
        </IonCardContent>
      </IonCard>
    </IonCard>
  );
}
