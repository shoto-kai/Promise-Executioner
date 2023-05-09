import { AppLocation } from "~/models/task/penalty/location/AppLocation";

export class LocationRestriction {
  /**
   * @param location 目的地
   * @param radius 許容誤差半径
   */
  constructor(readonly location: AppLocation, readonly radius: number) {}
}
