import React, { FC, useMemo, useState } from "react";
import { IonIcon, IonItem, IonLabel } from "@ionic/react";
import FriendItemProps from "./item/FriendItem.props";
import FriendItemModel from "./item/FriendItem.model";
import FriendItemState from "./item/FriendItem.state";

const FriendItem: FC<FriendItemProps> = (props) => {
  const [state, setState] = useState(FriendItemState.init(props));
  const model = useMemo(
    () => new FriendItemModel(props, state, setState),
    [props, state]
  );
  return (
    <IonItem>
      <IonIcon
        icon={model.icon}
        color="primary"
        onClick={model.onClickStarIcon}
        className="ion-margin-end"
      />
      <IonLabel>{model.username}</IonLabel>
    </IonItem>
  );
};

export default FriendItem;
