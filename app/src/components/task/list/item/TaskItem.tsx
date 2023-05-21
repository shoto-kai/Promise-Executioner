import { TaskItemProps as Props } from "~/components/task/list/item/TaskItem.props";
import { TaskItemModel as Model } from "~/components/task/list/item/TaskItem.model";
import { TaskItemState as State } from "~/components/task/list/item/TaskItem.state";
import React, { useMemo, useState } from "react";
import { IonItem, IonLabel } from "@ionic/react";

export default function TaskItem({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(() => new Model(props, state, setState), [props, state]);
  return (
    <IonItem detail={true} onClick={m.onClick}>
      <IonLabel>
        <IonLabel>
          <h1>{m.title}</h1>
        </IonLabel>
        <h2 style={{ color: "red" }}>代償 {m.amount}円</h2>
        <span>残り時間 {m.restTime}</span>
      </IonLabel>
    </IonItem>
  );
}
