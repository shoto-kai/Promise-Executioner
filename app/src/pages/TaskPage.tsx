import {
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import TaskView from "~/components/task/TaskView";
import { FC } from "react";

const TaskPage: FC = () => {
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
        <TaskView props={{}} />
      </IonContent>
    </IonPage>
  );
};

export default TaskPage;
