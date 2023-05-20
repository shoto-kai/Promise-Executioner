import { TaskFormProps as Props } from "~/components/task/create/form/TaskForm.props";
import { TaskFormState as State } from "~/components/task/create/form/TaskForm.state";
import { SelectButtonOption } from "~/components/common/button/select/SelectButton";

export class TaskFormModel {
  constructor(
    public readonly props: Props,
    public readonly state: State,
    public readonly setState: (s: State) => void
  ) {}

  /** タスク名 */
  readonly title = "タスク名";

  /** 備考 */
  readonly note = "備考";

  readonly penaltyOptions: readonly SelectButtonOption[] = [
    {
      label: "友達に送信",
      handler: () => console.log("友達に送信が選択された"),
    },
    {
      label: "Twitter公開",
      handler: () => console.log("Twitter公開が選択された"),
    },
  ];

  readonly restrictionOptions: readonly SelectButtonOption[] = [
    {
      label: "位置情報",
      handler: () => console.log("位置情報が選択された"),
    },
    {
      label: "期限",
      handler: () => console.log("期限が選択された"),
    },
  ];
}
