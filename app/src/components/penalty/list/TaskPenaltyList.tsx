import React, { useMemo, useState } from "react";
import { IonItem, IonList } from "@ionic/react";

export default function TaskPenaltyList() {
  return (
    <IonList>
      <IonItem>ペナルティ1</IonItem>
      <IonItem>ペナルティ2</IonItem>
    </IonList>
  );
}
