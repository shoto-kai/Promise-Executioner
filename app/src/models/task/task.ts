import {
  Restrictions,
  RestrictionsSchema,
} from "~/models/task/restriction/restrictions";
import * as crypto from "crypto";
import { Encodable } from "@lemonaderoom/lesource";
import { Penalties, PenaltiesSchema } from "~/models/task/penalty/penalties";
import { z } from "zod";

/** タスク */
export class Task implements Encodable {
  /**
   * @param id タスクUUID
   * @param title タスクタイトル
   * @param note タスクメモ
   * @param restrictions 制約一覧
   * @param penalties ペナルティ一覧
   * @param completionDate 完了日時
   * @param failureDate 失敗日時
   */
  constructor(
    readonly id: string = crypto.randomUUID(),
    readonly title: string = "",
    readonly note: string = "",
    readonly restrictions: Restrictions = new Restrictions(),
    readonly penalties: Penalties = new Penalties(),
    readonly completionDate?: Date,
    readonly failureDate?: Date
  ) {}

  encode(): unknown {
    return {
      id: this.id,
      title: this.title,
      note: this.note,
      restrictions: this.restrictions.encode(),
      penalties: this.penalties.encode(),
      completionDate: this.completionDate?.toISOString(),
      failureDate: this.failureDate?.toISOString(),
    };
  }

  static decode(data: unknown): Task {
    const schema = TaskSchema.parse(data);
    return new Task(
      schema.id,
      schema.title,
      schema.note,
      Restrictions.decode(schema.restrictions),
      Penalties.decode(schema.penalties),
      schema.completionDate == null
        ? undefined
        : new Date(schema.completionDate),
      schema.failureDate == null ? undefined : new Date(schema.failureDate)
    );
  }
}

export const TaskSchema = z.object({
  id: z.string().uuid(),
  title: z.string(),
  note: z.string(),
  restrictions: RestrictionsSchema,
  penalties: PenaltiesSchema,
  completionDate: z.string().datetime().optional(),
  failureDate: z.string().datetime().optional(),
});
