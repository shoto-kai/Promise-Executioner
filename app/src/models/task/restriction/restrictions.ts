import {
  DateLimitRestriction,
  DateLimitRestrictionSchema,
} from "~/models/task/restriction/dateLimitRestriction";
import { decodeArrayAs, Encodable, encodeArray } from "@lemonaderoom/lesource";
import { z } from "zod";
import {
  none,
  RestrictionLimit,
} from "~/models/task/restriction/restrictionLimit";

/** 制約一覧 */
export class Restrictions implements Encodable {
  /**
   * @param dateLimitRestrictions 期限の制約一覧
   */
  constructor(
    readonly dateLimitRestrictions: readonly DateLimitRestriction[] = []
  ) {}

  /** 全ての制約が満たされているか */
  get isCompleted(): boolean {
    return this.dateLimitRestrictions.every((r) => r.isCompleted);
  }

  get earliestLimit(): RestrictionLimit {
    if (this.dateLimitRestrictions.length === 0) return none;
    return this.dateLimitRestrictions
      .map((r) => r.restrictionLimit)
      .sort((a, b) => (a.isBefore(b) ? -1 : 1))[0];
  }

  encode(): unknown {
    return {
      dateLimitRestrictions: encodeArray(this.dateLimitRestrictions),
    };
  }

  static decode(data: unknown): Restrictions {
    const schema = RestrictionsSchema.parse(data);
    return new Restrictions(
      decodeArrayAs(DateLimitRestriction, schema.dateLimitRestrictions)
    );
  }
}

export const RestrictionsSchema = z.object({
  dateLimitRestrictions: z.array(DateLimitRestrictionSchema),
});
