import React, { useMemo, useState } from "react";
import { TaskCreateModalState as State } from "~/components/task/create/modal/TaskCreateModal.state";
import { TaskCreateModalProps as Props } from "~/components/task/create/modal/TaskCreateModal.props";
import { TaskCreateModalModel as Model } from "~/components/task/create/modal/TaskCreateModal.model";
import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonModal,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import CreateSendUserMessagePenaltyModal from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal";
import PenaltyCreateButton from "~/components/penalty/create/button/PenaltyCreateButton";
import CreateLocationRestrictionModal from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal";
import RestrictionCreateButton from "~/components/restriction/create/button/RestrictionCreateButton";

export default function TaskCreateModal({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(
    () => new Model(props, state, setState),
    [props, state, setState]
  );
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
        <h1>{m.title}</h1>
        <p>{m.note}</p>
        <p>
          <input
            type="text"
            onChange={m.onChangeTitle}
            placeholder="タスク名"
          />
        </p>
        <p>
          <input type="text" onChange={m.onChangeNote} placeholder="備考" />
        </p>
        <p>
          <PenaltyCreateButton
            onClick={m.onOpenCreateSendUserMessagePenaltyModal}
          />
        </p>
        <p>
          <RestrictionCreateButton
            onClick={m.onOpenCreateLocationRestrictionModal}
          />
        </p>

        <CreateSendUserMessagePenaltyModal
          props={m.createSendUserMessagePenaltyModalProps}
        />
        <CreateLocationRestrictionModal
          props={m.createLocationRestrictionModalProps}
        />
      </IonContent>
    </IonModal>
  );
}
