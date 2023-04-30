import { IonItem, IonLabel, IonList } from "@ionic/react";
import React, { FC } from "react";
import { Task } from "~/models/task/task";

interface Props {
  tasks: readonly Task[];
}

const TaskList: FC<Props> = ({ tasks }) => {
  return (
    <IonList inset={true}>
      {tasks.map((task) => (
        <IonItem key={task.id}>
          <IonLabel>{task.title}</IonLabel>
        </IonItem>
      ))}
    </IonList>
  );
};

export default TaskList;
