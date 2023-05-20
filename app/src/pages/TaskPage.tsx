import {
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import TaskView from "~/components/task/TaskView";
import { FC } from "react";
import { TaskPageModel as Model } from "~/pages/TaskPage.model";

const TaskPage: FC = () => {
  const m = new Model();
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Task</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Task</IonTitle>
          </IonToolbar>
        </IonHeader>
        <TaskView props={m.taskViewProps} />
      </IonContent>
    </IonPage>
  );
};

export default TaskPage;
