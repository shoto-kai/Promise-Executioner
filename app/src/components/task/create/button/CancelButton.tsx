import { IonButton } from "@ionic/react";

export default function CancelButton({ onClick }: { onClick: () => void }) {
  return (
    <IonButton
      slot="fixed"
      shape="round"
      color="primary"
      onClick={onClick}
      disabled={false}
    >
      キャンセル
    </IonButton>
  );
}
