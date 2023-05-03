import { Encodable } from "@lemonaderoom/lesource";
import * as crypto from "crypto";
import { AnotherUser, AnotherUserSchema } from "~/models/user/anotherUser";
import { z } from "zod";
import { decodeDate, encodeDate } from "~/models/date";

/** ユーザーに文字列を送信するペナルティ */
export class SendUserPenalty implements Encodable {
  /**
   * @param id ペナルティUUID
   * @param destinationUser 送り先ユーザー
   * @param overview 概要
   * @param note メモ
   * @param content 送信する文字列
   * @param executedAt 執行日時
   */
  constructor(
    readonly id: string = crypto.randomUUID(),
    readonly destinationUser: AnotherUser = new AnotherUser(),
    readonly overview: string = "",
    readonly note: string = "",
    readonly content: string = "",
    readonly executedAt?: Date
  ) {}

  encode(): unknown {
    return {
      id: this.id,
      destinationUser: this.destinationUser.encode(),
      overview: this.overview,
      note: this.note,
      content: this.content,
      executedAt: encodeDate(this.executedAt),
    };
  }

  static decode(data: unknown): SendUserPenalty {
    const schema = SendUserPenaltySchema.parse(data);
    return new SendUserPenalty(
      schema.id,
      AnotherUser.decode(schema.destinationUser),
      schema.overview,
      schema.note,
      schema.content,
      decodeDate(schema.executedAt)
    );
  }
}

export const SendUserPenaltySchema = z.object({
  id: z.string().uuid(),
  destinationUser: AnotherUserSchema,
  overview: z.string(),
  note: z.string(),
  content: z.string(),
  executedAt: z.string().datetime().optional(),
});
