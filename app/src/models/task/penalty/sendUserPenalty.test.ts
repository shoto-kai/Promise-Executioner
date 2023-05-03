import { describe } from "vitest";
import { SendUserPenalty } from "~/models/task/penalty/sendUserPenalty";
import { User } from "~/models/user/user";
import { AnotherUser } from "~/models/user/anotherUser";

describe("Send User Penalty Tests", () => {
  const executedPenalty = new SendUserPenalty(
    "1FB8708D-EBE0-4577-AFD5-18066C35F6A8",
    new AnotherUser(
      new User("26E069A3-8171-4F34-8895-B00D8EB74CE4", "田中"),
      false
    ),
    "PayPay 500円",
    "https://example.com",
    new Date("2021-10-01T00:00:00Z")
  );
  const executedJson = {
    id: "1FB8708D-EBE0-4577-AFD5-18066C35F6A8",
    destinationUser: {
      user: {
        id: "26E069A3-8171-4F34-8895-B00D8EB74CE4",
        name: "田中",
      },
      isMyFriend: false,
    },
    note: "PayPay 500円",
    content: "https://example.com",
    executedAt: "2021-10-01T00:00:00Z",
  };

  const unExecutedPenalty = new SendUserPenalty(
    "1FB8708D-EBE0-4577-AFD5-18066C35F6A8",
    new AnotherUser(
      new User("26E069A3-8171-4F34-8895-B00D8EB74CE4", "田中"),
      false
    ),
    "PayPay 500円",
    "https://example.com"
  );
  const unExecutedJson = {
    id: "1FB8708D-EBE0-4577-AFD5-18066C35F6A8",
    destinationUser: {
      user: {
        id: "26E069A3-8171-4F34-8895-B00D8EB74CE4",
        name: "田中",
      },
      isMyFriend: false,
    },
    note: "PayPay 500円",
    content: "https://example.com",
  };

  test("encode Test", () => {
    expect(executedPenalty.encode()).toEqual(executedJson);
    expect(unExecutedPenalty.encode()).toEqual(unExecutedJson);
  });

  test("decode Test", () => {
    expect(SendUserPenalty.decode(executedJson)).toEqual(executedPenalty);
    expect(SendUserPenalty.decode(unExecutedJson)).toEqual(unExecutedPenalty);
  });
});
