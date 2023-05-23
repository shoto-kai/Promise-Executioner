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
  IonDatetime,
  IonAccordionGroup,
  IonAccordion,
  IonItem,
  IonLabel,
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
          <IonTitle>時間制約の追加</IonTitle>
          <IonButtons slot="start">
            <IonButton onClick={m.onCancel}>キャンセル</IonButton>
          </IonButtons>
          <IonButtons slot="end">
            <IonButton onClick={m.onCreate}>作成</IonButton>
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent className="ion-padding">
        <IonAccordionGroup multiple={true} value="first">
          <IonAccordion value="first">
            <IonItem slot="header" color="light">
              <IonLabel>日付の指定</IonLabel>
            </IonItem>
            <div className="ion-padding" slot="content">
              <IonDatetime presentation="date"></IonDatetime>
            </div>
          </IonAccordion>
          <IonAccordion value="second">
            <IonItem slot="header" color="light">
              <IonLabel>時間の指定</IonLabel>
            </IonItem>
            <div className="ion-padding" slot="content">
              <IonDatetime presentation="time"></IonDatetime>
            </div>
          </IonAccordion>
        </IonAccordionGroup>
      </IonContent>
    </IonModal>
  );
}
