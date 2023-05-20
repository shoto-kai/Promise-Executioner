import { IonContent } from "@ionic/react";
import { useMemo, useState } from "react";
import { TaskDetailContentProps as Props } from "~/components/task/detail/content/TaskDetailContent.props";
import { TaskDetailContentModel as Model } from "~/components/task/detail/content/TaskDetailContent.model";
import { TaskDetailContentState as State } from "~/components/task/detail/content/TaskDetailContent.state";

export default function TaskDetailContent({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(() => new Model(props, state, setState), [props, state]);
  return (
    <IonContent class="ion-padding">
      <h1>{m.title}</h1>
      <p>{m.note}</p>
      <p>代償{m.amount}円</p>
    </IonContent>
  );
}
