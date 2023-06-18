import { IonNavLink, IonItem } from "@ionic/react";

import "./TaskCreateButton.css";

import TaskCreate from "~/components/task/create/modal/TaskCreate";
import { TaskCreateModalProps as Props } from "~/components/task/create/modal/TaskCreateModal.props";

export default function TaskCreateButton({
  onClick,
  props,
}: {
  onClick: () => void;
  props: Props;
}) {
  return (
    <IonNavLink
      routerDirection="forward"
      component={() => <TaskCreate props={props} />}
    >
      <IonItem detail={true}>作成</IonItem>
    </IonNavLink>
  );
}
