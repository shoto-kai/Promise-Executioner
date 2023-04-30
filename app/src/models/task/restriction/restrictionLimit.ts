interface IRestrictionLimit {
  get value(): Date | undefined;
  isBefore(compared: IRestrictionLimit): boolean;
  map<T>(cb: (date: Date) => T): T | undefined;
  getOrElse(date: Date): Date;
  orElse(date: Date): Some;
}

export function some(date: Date): IRestrictionLimit {
  return new Some(date);
}

export const none: IRestrictionLimit = {
  isBefore: () => false,
  value: undefined,
  map: () => undefined,
  getOrElse: (date) => date,
  orElse: (date) => new Some(date),
};

export class Some implements IRestrictionLimit {
  constructor(readonly value: Date) {}

  isBefore(compared: IRestrictionLimit): boolean {
    if (compared === none) return true;
    return this.value.getTime() < compared.value!.getTime();
  }

  map<T>(cb: (date: Date) => T): T | undefined {
    return cb(this.value);
  }

  getOrElse(): Date {
    return this.value;
  }

  orElse(): Some {
    return this;
  }
}

export type RestrictionLimit = typeof none | Some;
