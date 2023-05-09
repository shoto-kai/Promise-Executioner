import { TaskCreateButtonProps as Props } from "~/components/task/create/button/TaskCreateButton.props";
import { useMemo } from "react";
import { TaskCreateButtonModel as Model } from "~/components/task/create/button/TaskCreateButton.model";

export default function TaskCreateButton({ props }: { props: Props }) {
  const m = useMemo(() => new Model(props), [props]);
  return <button onClick={m.onClick}>タスク作成ボタン</button>;
}
