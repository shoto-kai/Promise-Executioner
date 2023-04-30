import { describe } from "vitest";
import { SendUserPenalty } from "~/models/task/penalty/sendUserPenalty";
import { User } from "~/models/user/user";
import { AnotherUser } from "~/models/user/anotherUser";

describe("Send User Penalty Tests", () => {
  const penalty = new SendUserPenalty(
    "1FB8708D-EBE0-4577-AFD5-18066C35F6A8",
    new AnotherUser(
      new User("26E069A3-8171-4F34-8895-B00D8EB74CE4", "田中"),
      false
    ),
    "https://example.com"
  );
  const json = {
    id: "1FB8708D-EBE0-4577-AFD5-18066C35F6A8",
    destinationUser: {
      user: {
        id: "26E069A3-8171-4F34-8895-B00D8EB74CE4",
        name: "田中",
      },
      isMyFriend: false,
    },
    content: "https://example.com",
  };

  test("encode Test", () => {
    expect(penalty.encode()).toEqual(json);
  });

  test("decode Test", () => {
    expect(SendUserPenalty.decode(json)).toEqual(penalty);
  });
});
