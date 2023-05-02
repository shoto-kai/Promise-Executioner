import NotificationItemProps from "~/components/notification/item/NotificationItem.props";
import { Notification } from "~/models/notification/notification";

export default class NotificationItemModel {
  constructor(readonly props: NotificationItemProps) {}

  get title(): string {
    return this.notification.title;
  }

  get noticeDateText(): string {
    const noticedAt = this.notification.noticedAt;
    const yyyy = String(noticedAt.getFullYear()).padStart(4, "0");
    const MM = String(noticedAt.getMonth() + 1).padStart(2, "0");
    const dd = String(noticedAt.getDate()).padStart(2, "0");
    return `${yyyy}/${MM}/${dd}`;
  }

  get icon(): string {
    return this.notification.icon;
  }

  get color(): string {
    return this.notification.color;
  }

  get fromUsername(): string | undefined {
    return this.notification.from?.name;
  }

  get isExistFromUser(): boolean {
    return this.notification.from != null;
  }

  get alreadyReadClassName(): string {
    return this.notification.isAlreadyRead ? "ion-hide" : "";
  }

  private get notification(): Notification {
    return this.props.notification;
  }
}
