import { IonButton } from "@ionic/react";

import "./TaskCreateButton.css";

export default function TaskCreateButton({ onClick }: { onClick: () => void }) {
  return (
    <IonButton
      slot="fixed"
      shape="round"
      color="primary"
      onClick={onClick}
      class="ion-margin"
    >
      作成
    </IonButton>
  );
}
