import {
  SendUserPenalty,
  SendUserPenaltySchema,
} from "~/models/task/penalty/sendUserPenalty";
import { decodeArrayAs, Encodable, encodeArray } from "@lemonaderoom/lesource";
import { z } from "zod";

/** ペナルティ一覧 */
export class Penalties implements Encodable {
  /**
   * @param sendUserPenalties ユーザーに文字列を送信するペナルティ一覧
   */
  constructor(readonly sendUserPenalties: readonly SendUserPenalty[] = []) {}

  encode(): unknown {
    return {
      sendUserPenalties: encodeArray(this.sendUserPenalties),
    };
  }

  static decode(data: unknown): Penalties {
    const schema = PenaltiesSchema.parse(data);
    return new Penalties(
      decodeArrayAs(SendUserPenalty, schema.sendUserPenalties)
    );
  }
}

export const PenaltiesSchema = z.object({
  sendUserPenalties: z.array(SendUserPenaltySchema),
});
