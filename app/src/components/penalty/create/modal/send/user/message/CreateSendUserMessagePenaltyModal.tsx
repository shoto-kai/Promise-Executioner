import React, { useEffect, useMemo, useRef, useState } from "react";
import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonInput,
  IonItem,
  IonModal,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import { CreateSendUserMessagePenaltyModalProps as Props } from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal.props";
import { CreateSendUserMessagePenaltyModalState as State } from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal.state";
import { CreateSendUserMessagePenaltyModalModel as Model } from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal.model";

export default function CreateSendUserMessagePenaltyModal({
  props,
}: {
  props: Props;
}) {
  const [state, setState] = useState(State.init);
  const m = useMemo(
    () => new Model(props, state, setState),
    [props, state, setState]
  );

  return (
    <IonModal isOpen={m.isOpen}>
      <IonHeader>
        <IonToolbar>
          <IonTitle>ペナルティー新規作成</IonTitle>
          <IonButtons slot="start">
            <IonButton onClick={m.onCancel}>キャンセル</IonButton>
          </IonButtons>
          <IonButtons slot="end">
            <IonButton onClick={m.onCreate}>作成</IonButton>
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent className="ion-padding">
        <p>
          <IonItem>
            <IonInput
              type="text"
              // onChange={m.onChangeTitle}
              placeholder="タイトル"
            />
          </IonItem>
          <IonItem>
            <IonInput
              type="number"
              // onChange={m.onChangePrice}
              placeholder="金額"
            />
          </IonItem>
          <IonItem>
            <IonInput
              type="text"
              // onChange={m.onChangeDestinedUsername}
              placeholder="宛先ユーザー名"
            />
          </IonItem>
          <IonItem>
            <IonInput type="text" placeholder="送信内容（リンク等）" />
          </IonItem>
          <IonItem>
            <IonInput type="text" placeholder="備考" />
          </IonItem>
        </p>
      </IonContent>
    </IonModal>
  );
}
