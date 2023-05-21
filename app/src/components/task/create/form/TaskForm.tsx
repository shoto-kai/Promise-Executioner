import React, { useMemo, useState } from "react";
import { TaskFormProps as Props } from "~/components/task/create/form/TaskForm.props";
import { TaskFormState as State } from "~/components/task/create/form/TaskForm.state";
import { TaskFormModel as Model } from "~/components/task/create/form/TaskForm.model";
import {
  IonContent,
  IonItem,
  IonList,
  IonInput,
  IonCard,
  IonCardContent,
  IonTextarea,
  IonText,
  IonAccordionGroup,
  IonAccordion,
} from "@ionic/react";
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
      <IonCard>
        <IonCardContent style={{ padding: "0 0 1rem 0" }}>
          <IonItem>
            <IonText>タスク名</IonText>
          </IonItem>
          <IonItem>
            <IonInput placeholder="明日こそは起きる"></IonInput>
          </IonItem>
        </IonCardContent>

        <IonAccordionGroup value="first" style={{ padding: "0 0 1rem 0" }}>
          <IonAccordion value="first">
            <IonItem slot="header">
              <IonText>制約一覧</IonText>
            </IonItem>
            <div className="ion-padding" slot="content">
              <SelectButton label="新規条件" options={m.restrictionOptions} />
              <IonList>
                <IonItem>条件1</IonItem>
                <IonItem>条件2</IonItem>
              </IonList>
            </div>
          </IonAccordion>
        </IonAccordionGroup>

        <IonAccordionGroup value="first" style={{ padding: "0 0 1rem 0" }}>
          <IonAccordion value="first">
            <IonItem slot="header">
              <IonText>ペナルティ一覧</IonText>
            </IonItem>
            <div className="ion-padding" slot="content">
              <SelectButton label="新規ペナルティ" options={m.penaltyOptions} />
              <IonList></IonList>
              <TaskPenaltyList />
            </div>
          </IonAccordion>
        </IonAccordionGroup>

        <IonCardContent style={{ padding: "0" }}>
          <IonItem>
            <IonText>備考</IonText>
          </IonItem>
          <IonItem>
            <IonTextarea placeholder="明日こそは起きる"></IonTextarea>
          </IonItem>
        </IonCardContent>
      </IonCard>
    </IonContent>
  );
}
