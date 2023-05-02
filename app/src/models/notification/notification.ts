import { Encodable } from "@lemonaderoom/lesource";
import { z } from "zod";
import { AnotherUser, AnotherUserSchema } from "~/models/user/anotherUser";
import {
  NotificationType,
  notificationTypes,
  NotificationTypeSchema,
  NotificationTypeValue,
} from "~/models/notification/notificationType";

export class Notification implements Encodable {
  /**
   * @param id 通知UUID
   * @param type 通知タイプ
   * @param title タイトル
   * @param noticedAt 通知生成日時
   * @param isAlreadyRead 既読
   * @param from 通知元ユーザー
   */
  constructor(
    readonly id: string = crypto.randomUUID(),
    readonly type: NotificationType = "gift",
    readonly title: string = "",
    readonly noticedAt: Date = new Date(),
    readonly isAlreadyRead: boolean = false,
    readonly from?: AnotherUser
  ) {}

  get icon(): string {
    return this.typeValue.icon;
  }

  get color(): string {
    return this.typeValue.color;
  }

  get typeValue(): NotificationTypeValue {
    return notificationTypes[this.type];
  }

  encode(): unknown {
    return {
      id: this.id,
      type: this.type,
      title: this.title,
      noticedAt: this.noticedAt.toISOString(),
      isAlreadyRead: this.isAlreadyRead,
      from: this.from?.encode(),
    };
  }

  static decode(json: unknown): Notification {
    const schema = NotificationSchema.parse(json);
    return new Notification(
      schema.id,
      schema.type,
      schema.title,
      new Date(schema.noticedAt),
      schema.isAlreadyRead,
      AnotherUser.decode(schema.from)
    );
  }
}

const NotificationSchema = z.object({
  id: z.string().uuid(),
  type: NotificationTypeSchema,
  title: z.string(),
  noticedAt: z.string().datetime(),
  isAlreadyRead: z.boolean(),
  from: AnotherUserSchema.optional(),
});
