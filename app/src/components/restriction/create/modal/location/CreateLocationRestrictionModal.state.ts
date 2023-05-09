export class CreateLocationRestrictionModalState {
  static readonly init = new CreateLocationRestrictionModalState(0);

  /**
   * @param radius 許容誤差半径
   */
  constructor(readonly radius: number) {}

  readonly setRadius = (
    radius: number
  ): CreateLocationRestrictionModalState => {
    return new CreateLocationRestrictionModalState(radius);
  };
}
