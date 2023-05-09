import { useMemo, useState } from "react";
import { TaskCreateModalState as State } from "~/components/task/create/modal/TaskCreateModal.state";
import { TaskCreateModalProps as Props } from "~/components/task/create/modal/TaskCreateModal.props";
import { TaskCreateModalModel as Model } from "~/components/task/create/modal/TaskCreateModal.model";

export default function TaskCreateModal({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(() => new Model(props, state, setState), [state, setState]);
  return (
    <>
      <h1>{m.title}</h1>
      <p>{m.note}</p>
    </>
  );
}
