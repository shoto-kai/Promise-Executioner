import { Encodable } from "@lemonaderoom/lesource";
import * as crypto from "crypto";
import { z } from "zod";

/** ユーザー */
export class User implements Encodable {
  /**
   * @param id ユーザーUUID
   * @param name ユーザー名
   */
  constructor(
    readonly id: string = crypto.randomUUID(),
    readonly name: string = ""
  ) {}

  encode(): unknown {
    return { id: this.id, name: this.name };
  }

  static decode(data: unknown): User {
    const schema = UserSchema.parse(data);
    return new User(schema.id, schema.name);
  }
}

export const UserSchema = z.object({
  id: z.string().uuid(),
  name: z.string(),
});
