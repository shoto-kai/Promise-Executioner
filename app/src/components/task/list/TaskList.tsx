import { IonList, IonNavLink } from "@ionic/react";
import React, { useEffect, useMemo, useState } from "react";
import { TaskListProps as Props } from "~/components/task/list/TaskList.props";
import { TaskListState as State } from "~/components/task/list/TaskList.state";
import { TaskListModel } from "~/components/task/list/TaskList.model";
import TaskItem from "~/components/task/list/item/TaskItem";
import TaskDetail from "~/components/task/detail/TaskDetail";

export default function TaskList({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(
    () => new TaskListModel(props, state, setState),
    [props, state]
  );
  useEffect(() => {
    const timer = setInterval(m.setNow, 1000);
    return () => clearInterval(timer);
  });
  return (
    <IonList inset={true}>
      {m.items.map((item) => (
        <IonNavLink
          routerDirection="forward"
          component={() => <TaskDetail />}
          key={item.id}
        >
          <TaskItem props={item} />
        </IonNavLink>
      ))}
    </IonList>
  );
}
