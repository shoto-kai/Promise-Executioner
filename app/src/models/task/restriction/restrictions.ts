import {
  DateLimitRestriction,
  DateLimitRestrictionSchema,
} from "~/models/task/restriction/dateLimitRestriction";
import { decodeArrayAs, Encodable, encodeArray } from "@lemonaderoom/lesource";
import { z } from "zod";

/** 制約一覧 */
export class Restrictions implements Encodable {
  /**
   * @param dateLimitRestrictions 期限の制約一覧
   */
  constructor(
    readonly dateLimitRestrictions: readonly DateLimitRestriction[] = []
  ) {}

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
