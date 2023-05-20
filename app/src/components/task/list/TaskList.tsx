import { IonList, IonNavLink } from "@ionic/react";
import React, { useEffect, useMemo, useState } from "react";
import { TaskListProps as Props } from "~/components/task/list/TaskList.props";
import { TaskListState as State } from "~/components/task/list/TaskList.state";
import { TaskListModel } from "~/components/task/list/TaskList.model";
import TaskItem from "~/components/task/list/item/TaskItem";
import TaskDetailView from "~/components/task/detail/view/TaskDetailView";

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
          component={() => <TaskDetailView props={item} />}
          key={item.task.id}
        >
          <TaskItem props={item} />
        </IonNavLink>
      ))}
    </IonList>
  );
}
