import React, { useState, useMemo } from "react";
import { CreateLocationRestrictionModalModel as Model } from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal.model";
import { CreateLocationRestrictionModalState as State } from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal.state";
import { CreateLocationRestrictionModalProps as Props } from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal.props";
import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonModal,
  IonTitle,
  IonToolbar,
} from "@ionic/react";

export default function CreateLocationRestrictionModal({
  props,
}: {
  props: Props;
}) {
  const [state, setState] = useState(State.init);
  const m = useMemo(() => new Model(props, state, setState), [props, state]);
  return (
    <IonModal isOpen={m.isOpen}>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Modal</IonTitle>
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
          <input
            type="number"
            onChange={m.onChangeRadius}
            placeholder="許容誤差半径km"
          />
        </p>
      </IonContent>
    </IonModal>
  );
}
