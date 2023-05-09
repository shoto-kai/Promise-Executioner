import { CreateLocationRestrictionModalState as State } from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal.state";
import { CreateLocationRestrictionModalProps as Props } from "~/components/restriction/create/modal/location/CreateLocationRestrictionModal.props";
import { LocationRestriction } from "~/models/task/penalty/location/LocationRestriction";
import { AppLocation } from "~/models/task/penalty/location/AppLocation";
import { ChangeEvent } from "react";

export class CreateLocationRestrictionModalModel {
  constructor(
    private readonly props: Props,
    private readonly state: State,
    private readonly setState: (s: State) => void
  ) {}

  get isOpen(): boolean {
    return this.props.isOpen;
  }

  readonly onCreate = () => {
    this.props.onCreate(
      new LocationRestriction(new AppLocation(0, 0), this.state.radius)
    );
  };

  readonly onCancel = () => {
    this.props.onCancel();
  };

  readonly onChangeRadius = (event: ChangeEvent<HTMLInputElement>) => {
    this.setState(this.state.setRadius(Number(event.target.value)));
  };
}
