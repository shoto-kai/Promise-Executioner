import {
  IonBackButton,
  IonButton,
  IonButtons,
  IonHeader,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import React, { useMemo, useState } from "react";
import { TaskDetailViewModel as Model } from "~/components/task/detail/view/TaskDetailView.model";
import { TaskDetailViewState as State } from "~/components/task/detail/view/TaskDetailView.state";
import { TaskDetailViewProps as Props } from "~/components/task/detail/view/TaskDetailView.props";
import TaskDetailContent from "~/components/task/detail/content/TaskDetailContent";

export default function TaskDetailView({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(() => new Model(props, state, setState), [props, state]);
  return (
    <>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonBackButton />
          </IonButtons>
          <IonTitle>{m.title}</IonTitle>
          <IonButtons slot="end">
            <IonButton>編集</IonButton>
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <TaskDetailContent props={m.contentProps} />
    </>
  );
}
