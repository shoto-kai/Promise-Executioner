import React, { useMemo, useState } from "react";
import { TaskFormProps as Props } from "~/components/task/create/form/TaskForm.props";
import { TaskFormState as State } from "~/components/task/create/form/TaskForm.state";
import { TaskFormModel as Model } from "~/components/task/create/form/TaskForm.model";
import { IonContent } from "@ionic/react";
import CreateSendUserMessagePenaltyModal from "~/components/penalty/create/modal/send/user/message/CreateSendUserMessagePenaltyModal";
import PenaltyCreateButton from "~/components/penalty/create/button/PenaltyCreateButton";
import CreateLocationRestrictionModal from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal";
import RestrictionCreateButton from "~/components/restriction/create/button/RestrictionCreateButton";
import SelectButton from "~/components/common/button/select/SelectButton";

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
      <SelectButton label="新規ペナルティ" options={m.penaltyOptions} />
      <SelectButton label="新規条件" options={m.restrictionOptions} />
    </IonContent>
  );
}
