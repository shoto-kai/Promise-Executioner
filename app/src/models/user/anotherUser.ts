import { User, UserSchema } from "~/models/user/user";
import { Encodable } from "@lemonaderoom/lesource";
import { z } from "zod";

/** 他人のユーザー */
export class AnotherUser implements Encodable {
  /**
   * @param user ユーザー
   * @param isMyFriend 自分とフレンドかどうか
   */
  constructor(
    readonly user: User = new User(),
    readonly isMyFriend: boolean = false
  ) {}

  encode(): unknown {
    return {
      user: this.user.encode(),
      isMyFriend: this.isMyFriend,
    };
  }

  static decode(data: unknown): AnotherUser {
    const schema = AnotherUserSchema.parse(data);
    return new AnotherUser(User.decode(schema.user), schema.isMyFriend);
  }
}

export const AnotherUserSchema = z.object({
  user: UserSchema,
  isMyFriend: z.boolean(),
});
