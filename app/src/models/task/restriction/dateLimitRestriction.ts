import { z } from "zod";
import { Encodable } from "@lemonaderoom/lesource";
import {
  none,
  RestrictionLimit,
  some,
} from "~/models/task/restriction/restrictionLimit";

/** 期限の制約 */
export class DateLimitRestriction implements Encodable {
  /**
   * @param id 期限制約UUID
   * @param limit 期限日時
   * @param completedAt 完了日時
   */
  constructor(
    readonly id: string = crypto.randomUUID(),
    readonly limit: Date = new Date(),
    readonly completedAt?: Date
  ) {}

  /** 完了したかどうか */
  get isCompleted(): boolean {
    if (this.completedAt == null) return false;
    return this.limit.getTime() >= this.completedAt.getTime();
  }

  get restrictionLimit(): RestrictionLimit {
    if (this.isCompleted) return none;
    return some(this.limit);
  }

  encode(): unknown {
    return {
      id: this.id,
      limit: this.limit.toISOString(),
      completedAt: this.completedAt?.toISOString(),
    };
  }

  static decode(data: unknown): DateLimitRestriction {
    const schema = DateLimitRestrictionSchema.parse(data);
    return new DateLimitRestriction(
      schema.id,
      new Date(schema.limit),
      schema.completedAt == null ? undefined : new Date(schema.completedAt)
    );
  }
}

export const DateLimitRestrictionSchema = z.object({
  id: z.string().uuid(),
  limit: z.string().datetime(),
  completedAt: z.string().datetime().optional(),
});
