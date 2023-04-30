import { describe } from "vitest";
import { Penalties } from "~/models/task/penalty/penalties";
import { SendUserPenalty } from "~/models/task/penalty/sendUserPenalty";
import { AnotherUser } from "~/models/user/anotherUser";
import { User } from "~/models/user/user";

describe("Penalties Tests", () => {
  const penalties = new Penalties([
    new SendUserPenalty(
      "F003C4A8-9E26-4828-814C-C0BABB71A961",
      new AnotherUser(
        new User("6C959AE3-B99D-4476-9BF3-F22D5CA14545", "田中"),
        false
      ),
      "https://example.com"
    ),
    new SendUserPenalty(
      "5E5126E2-9DB3-4EBE-84FA-7DD8AE0428E9",
      new AnotherUser(
        new User("FCF4F1DC-2435-4E6D-B8C3-3BB9E3DF0AD7", "中田"),
        true
      ),
      "https://hello.world.com"
    ),
  ]);
  const json = {
    sendUserPenalties: [
      {
        id: "F003C4A8-9E26-4828-814C-C0BABB71A961",
        destinationUser: {
          user: {
            id: "6C959AE3-B99D-4476-9BF3-F22D5CA14545",
            name: "田中",
          },
          isMyFriend: false,
        },
        content: "https://example.com",
      },
      {
        id: "5E5126E2-9DB3-4EBE-84FA-7DD8AE0428E9",
        destinationUser: {
          user: {
            id: "FCF4F1DC-2435-4E6D-B8C3-3BB9E3DF0AD7",
            name: "中田",
          },
          isMyFriend: true,
        },
        content: "https://hello.world.com",
      },
    ],
  };

  test("encode Test", () => {
    expect(penalties.encode()).toEqual(json);
  });

  test("decode Test", () => {
    expect(Penalties.decode(json)).toEqual(penalties);
  });
});
