import {
  IonButton,
  IonContent,
  IonItem,
  IonList,
  IonPopover,
} from "@ionic/react";
import { FC } from "react";

export interface SelectButtonOption {
  label: string;
  handler: () => unknown;
}

interface Props {
  label: string;
  options: readonly SelectButtonOption[];
}

const SelectButton: FC<Props> = ({ label, options }) => {
  const id = crypto.randomUUID();
  return (
    <>
      <IonButton id={id}>{label}</IonButton>
      <IonPopover
        trigger={id}
        dismissOnSelect={true}
        onWillDismiss={console.log}
      >
        <IonContent>
          <IonList>
            {options.map((option) => (
              <IonItem
                button={true}
                detail={false}
                onClick={option.handler}
                key={option.label}
              >
                {option.label}
              </IonItem>
            ))}
          </IonList>
        </IonContent>
      </IonPopover>
    </>
  );
};

export default SelectButton;
