import { LocationRestriction } from "~/models/task/penalty/location/LocationRestriction";

export interface CreateLocationRestrictionModalProps {
  isOpen: boolean;
  onCreate: (restriction: LocationRestriction) => void;
  onCancel: () => void;
}
