import { describe, test } from "vitest";
import { Notification } from "./notification";
import { AnotherUser } from "~/models/user/anotherUser";
import { User } from "~/models/user/user";
import { gift } from "ionicons/icons";

describe("Notification Tests", () => {
  const notification = new Notification(
    "67298399-FBA0-4D6A-9B43-C31FB57B3460",
    "gift",
    "田中からペナルティのプレゼントが届きました",
    new Date("2021-10-01T00:00:00.000Z"),
    true,
    new AnotherUser(
      new User("CFAB3E6E-BDCB-4E99-BE4F-717E74E9A881", "田中"),
      true
    )
  );
  const json = {
    id: "67298399-FBA0-4D6A-9B43-C31FB57B3460",
    type: "gift",
    title: "田中からペナルティのプレゼントが届きました",
    noticedAt: "2021-10-01T00:00:00.000Z",
    isAlreadyRead: true,
    from: {
      user: {
        id: "CFAB3E6E-BDCB-4E99-BE4F-717E74E9A881",
        name: "田中",
      },
      isMyFriend: true,
    },
  };

  test("encode Test", () => {
    expect(notification.encode()).toEqual(json);
  });

  test("decode Test", () => {
    expect(Notification.decode(json)).toEqual(notification);
  });

  test("giftのアイコンはgiftである", () => {
    expect(notification.icon).toBe(gift);
  });

  test("giftのカラーはsuccess", () => {
    expect(notification.color).toBe("success");
  });
});
