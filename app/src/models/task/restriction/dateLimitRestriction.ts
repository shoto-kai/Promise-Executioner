import { z } from "zod";
import { Encodable } from "@lemonaderoom/lesource";

/** 期限の制約 */
export class DateLimitRestriction implements Encodable {
  /**
   * @param id 期限制約ID
   * @param limit 期限日時
   */
  constructor(readonly id: number, readonly limit: Date) {}

  encode(): unknown {
    return {
      id: this.id,
      limit: this.limit.toISOString(),
    };
  }

  static decode(data: unknown): DateLimitRestriction {
    const schema = DateLimitRestrictionSchema.parse(data);
    return new DateLimitRestriction(schema.id, new Date(schema.limit));
  }
}

export const DateLimitRestrictionSchema = z.object({
  id: z.number(),
  limit: z.string().datetime(),
});
