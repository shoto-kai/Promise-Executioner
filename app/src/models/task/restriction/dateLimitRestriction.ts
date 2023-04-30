import { z } from "zod";
import { Encodable } from "@lemonaderoom/lesource";

/** 期限の制約 */
export class DateLimitRestriction implements Encodable {
  /**
   * @param id 期限制約UUID
   * @param limit 期限日時
   * @param completionDate 完了日時
   */
  constructor(
    readonly id: string = crypto.randomUUID(),
    readonly limit: Date = new Date(),
    readonly completionDate?: Date
  ) {}

  encode(): unknown {
    return {
      id: this.id,
      limit: this.limit.toISOString(),
      completionDate: this.completionDate?.toISOString(),
    };
  }

  static decode(data: unknown): DateLimitRestriction {
    const schema = DateLimitRestrictionSchema.parse(data);
    return new DateLimitRestriction(
      schema.id,
      new Date(schema.limit),
      schema.completionDate == null
        ? undefined
        : new Date(schema.completionDate)
    );
  }
}

export const DateLimitRestrictionSchema = z.object({
  id: z.string().uuid(),
  limit: z.string().datetime(),
  completionDate: z.string().datetime().optional(),
});
