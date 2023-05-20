import React, { useMemo, useState } from "react";
import { TaskFormProps as Props } from "~/components/task/create/form/TaskForm.props";
import { TaskFormState as State } from "~/components/task/create/form/TaskForm.state";
import { TaskFormModel as Model } from "~/components/task/create/form/TaskForm.model";
import { IonContent, IonItem, IonList } from "@ionic/react";
import CreateSendUserMessagePenaltyModal from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal";
import CreateLocationRestrictionModal from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal";
import SelectButton from "~/components/common/button/select/SelectButton";
import TaskPenaltyList from "~/components/penalty/list/TaskPenaltyList";

export default function TaskForm({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(
    () => new Model(props, state, setState),
    [props, state, setState]
  );
  return (
    <IonContent className="ion-padding">
      <h1>{m.title}</h1>
      <p>{m.note}</p>
      <p>
        <input type="text" placeholder="タスク名" />
      </p>
      <p>
        <input type="text" placeholder="備考" />
      </p>
      <p>
        <span>ペナルティ一覧</span>
        <SelectButton label="新規ペナルティ" options={m.penaltyOptions} />
      </p>
      <TaskPenaltyList />
      <p>
        <span>条件一覧</span>
        <SelectButton label="新規条件" options={m.restrictionOptions} />
      </p>

      <IonList>
        <IonItem>条件1</IonItem>
        <IonItem>条件2</IonItem>
      </IonList>
      <CreateSendUserMessagePenaltyModal props={m.sendUserPenaltyProps} />
      <CreateLocationRestrictionModal props={m.locationRestrictionProps} />
    </IonContent>
  );
}
