import { IonNavLink, IonItem } from "@ionic/react";

import "./TaskCreateButton.css";

import TaskCreate from "~/components/task/create/modal/TaskCreate";

export default function TaskCreateButton({
  onClick,
  props,
}: {
  onClick: () => void;
  props: Props;
}) {
  return (
    // <IonButton slot="fixed" shape="round" color="primary" onClick={onClick}>
    //   作成
    // </IonButton>
    <IonNavLink
      routerDirection="forward"
      component={() => <TaskCreate props={props} />}
    >
      <IonItem detail={true}>作成</IonItem>
    </IonNavLink>
  );
}
