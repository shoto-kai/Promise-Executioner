import React, { FC, useMemo } from "react";
import {
  IonCol,
  IonContent,
  IonGrid,
  IonIcon,
  IonItem,
  IonLabel,
  IonRow,
  IonText,
  IonTitle,
} from "@ionic/react";
import Props from "./item/NotificationItem.props";
import NotificationItemModel from "~/components/notification/item/NotificationItem.model";
import { ellipse } from "ionicons/icons";

const NotificationItem: FC<Props> = (props) => {
  const model = useMemo(() => new NotificationItemModel(props), [props]);
  return (
    <IonItem button detail={true}>
      <IonLabel>
        <IonGrid className="ion-justify-content-start">
          <IonRow className="ion-justify-content-start">
            <IonCol size="1" className="ion-align-self-center">
              <IonIcon
                size="small"
                icon={ellipse}
                color="primary"
                className={model.alreadyReadClassName}
              />
            </IonCol>
            <IonCol size="1" className="ion-margin-end ion-align-self-center">
              <IonIcon size="large" icon={model.icon} color={model.color} />
            </IonCol>
            <IonCol size="9">
              <h2 className="ion-text-wrap">{model.title}</h2>
              <IonText className="ion-text-right" color="medium">
                <sub>{model.noticeDateText}</sub>
              </IonText>
              <span className="ion-padding" />
              <IonText color="primary">
                <sub className={model.isExistFromUser ? "" : "ion-hide"}>
                  from {model.fromUsername}
                </sub>
              </IonText>
            </IonCol>
          </IonRow>
        </IonGrid>
      </IonLabel>
    </IonItem>
  );
};

export default NotificationItem;
