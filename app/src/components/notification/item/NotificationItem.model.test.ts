import { describe } from "vitest";
import { Notification } from "~/models/notification/notification";
import { AnotherUser } from "~/models/user/anotherUser";
import { User } from "~/models/user/user";
import NotificationItemModel from "~/components/notification/item/NotificationItem.model";
import { gift } from "ionicons/icons";

describe("NotificationItem Model Tests", () => {
  const model = new NotificationItemModel({
    notification: new Notification(
      "67298399-FBA0-4D6A-9B43-C31FB57B3460",
      "gift",
      "田中からペナルティのプレゼントが届きました",
      new Date("2021-10-01T21:00:00Z"),
      true,
      new AnotherUser(
        new User("CFAB3E6E-BDCB-4E99-BE4F-717E74E9A881", "田中"),
        true
      )
    ),
  });

  test("タイトルの取得", () => {
    expect(model.title).toEqual("田中からペナルティのプレゼントが届きました");
  });

  test("通知日の取得", () => {
    expect(model.noticeDateText).toBe("2021/10/02");
  });

  test("notification iconの委譲", () => {
    expect(model.icon).toBe(gift);
  });

  test("notification colorの委譲", () => {
    expect(model.color).toBe("success");
  });

  test("from ユーザー名の取得", () => {
    expect(model.fromUsername).toBe("田中");
  });

  test("ユーザーがあるか", () => {
    expect(model.isExistFromUser).toBeTruthy();
  });

  test("既読", () => {
    expect(model.alreadyReadClassName).toBe("ion-hide");
  });

  test("未読", () => {
    const model = new NotificationItemModel({
      notification: new Notification(
        "67298399-FBA0-4D6A-9B43-C31FB57B3460",
        "gift",
        "",
        new Date(),
        false
      ),
    });
    expect(model.alreadyReadClassName).toBe("");
  });
});
