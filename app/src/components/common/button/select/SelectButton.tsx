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
  return (
    <>
      <IonButton id="popover-button">{label}</IonButton>
      <IonPopover trigger="popover-button" dismissOnSelect={true}>
        <IonContent>
          <IonList>
            {options.map((option) => (
              <IonItem button={true} detail={false} onClick={option.handler}>
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
