import React, { useState, useMemo } from "react";
import { CreateLocationRestrictionModalModel as Model } from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal.model";
import { CreateLocationRestrictionModalState as State } from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal.state";
import { CreateLocationRestrictionModalProps as Props } from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal.props";
import {
  IonButton,
  IonButtons,
  IonHeader,
  IonModal,
  IonTitle,
  IonToolbar,
  IonItem,
  IonRange,
} from "@ionic/react";

import GoogleMap from "./GoogleMap";
import { useGeocode } from "./useGeocode";
import SearchForm from "./SearchForm";
import useCurrentLocation from "./useCurrentLocation";

export default function CreateLocationRestrictionModal({
  props,
}: {
  props: Props;
}) {
  const [state, setState] = useState(State.init);
  const m = useMemo(() => new Model(props, state, setState), [props, state]);
  const [input, setInput] = useState("");
  // キーワードから座標を取得
  const { coordinates, error: geocodeError } = useGeocode(
    "AIzaSyDAhn16MDH7Iyq-DdwMDRGuQu5wTHOAlS8",
    input
  );
  // 現在地の座標を取得
  const { location, error: locationError } = useCurrentLocation();
  return (
    <IonModal isOpen={m.isOpen}>
      <IonHeader>
        <IonToolbar>
          <IonTitle>空間制約の追加</IonTitle>
          <IonButtons slot="start">
            <IonButton onClick={m.onCancel}>キャンセル</IonButton>
          </IonButtons>
          <IonButtons slot="end">
            <IonButton onClick={m.onCreate}>作成</IonButton>
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <div
        className="ion-padding"
        slot="content"
        style={{ width: "100%", height: "35rem" }}
      >
        <GoogleMap
          apiKey="AIzaSyDAhn16MDH7Iyq-DdwMDRGuQu5wTHOAlS8"
          center={
            coordinates
              ? { lat: coordinates.lat, lng: coordinates.lng }
              : location
              ? { lat: location.latitude, lng: location.longitude }
              : { lat: 35.6895, lng: 139.6917 }
          }
          zoom={12}
        />
        <SearchForm onSearch={setInput} />
        <IonItem style={{ marginTop: "2rem" }}>制約の範囲を指定</IonItem>
        <IonItem>
          <IonRange
            ticks={true}
            snaps={true}
            min={0}
            max={10}
            value={1}
          ></IonRange>
        </IonItem>
      </div>
    </IonModal>
  );
}
