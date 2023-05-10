import { IonButton } from "@ionic/react";

export default function TaskCreateButton({ onClick }: { onClick: () => void }) {
  return (
    <IonButton
      shape="round"
      color="primary"
      onClick={onClick}
      class="ion-margin"
    >
      タスク作成ボタン
    </IonButton>
  );
}
