import { Encodable } from "@lemonaderoom/lesource";
import * as crypto from "crypto";
import { AnotherUser, AnotherUserSchema } from "~/models/user/anotherUser";
import { z } from "zod";

/** ユーザーに文字列を送信するペナルティ */
export class SendUserPenalty implements Encodable {
  /**
   * @param id ペナルティUUID
   * @param destinationUser 送り先ユーザー
   * @param note メモ
   * @param content 送信する文字列
   * @param executedAt 執行日時
   */
  constructor(
    readonly id: string = crypto.randomUUID(),
    readonly destinationUser: AnotherUser = new AnotherUser(),
    readonly note: string = "",
    readonly content: string = "",
    readonly executedAt?: Date
  ) {}

  encode(): unknown {
    return {
      id: this.id,
      destinationUser: this.destinationUser.encode(),
      note: this.note,
      content: this.content,
      executedAt: this.executedAt?.toISOString(),
    };
  }

  static decode(data: unknown): SendUserPenalty {
    const schema = SendUserPenaltySchema.parse(data);
    return new SendUserPenalty(
      schema.id,
      AnotherUser.decode(schema.destinationUser),
      schema.note,
      schema.content,
      schema.executedAt == null ? undefined : new Date(schema.executedAt)
    );
  }
}

export const SendUserPenaltySchema = z.object({
  id: z.string().uuid(),
  destinationUser: AnotherUserSchema,
  note: z.string(),
  content: z.string(),
  executedAt: z.string().datetime().optional(),
});
