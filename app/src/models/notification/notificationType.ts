import { z } from "zod";
import { alertCircle, gift, ticket } from "ionicons/icons";

export type NotificationType =
  | "gift" // プレゼント通知
  | "penalty" // ペナルティ通知
  | "sign"; // 制約通知

export const NotificationTypeSchema = z.enum(["gift", "penalty", "sign"]);

export class NotificationTypeValue {
  constructor(readonly icon: string, readonly color: string) {}
}
export const notificationTypes: Record<
  NotificationType,
  NotificationTypeValue
> = {
  gift: new NotificationTypeValue(gift, "success"),
  penalty: new NotificationTypeValue(alertCircle, "danger"),
  sign: new NotificationTypeValue(ticket, "secondary"),
};
