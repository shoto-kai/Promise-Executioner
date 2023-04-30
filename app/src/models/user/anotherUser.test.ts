import { describe } from "vitest";
import { AnotherUser } from "~/models/user/anotherUser";
import { User } from "~/models/user/user";

describe("Another User Tests", () => {
  const anotherUser = new AnotherUser(
    new User("EBF01170-670A-401D-AAAA-94572B822A43", "田中"),
    true
  );
  const json = {
    user: {
      id: "EBF01170-670A-401D-AAAA-94572B822A43",
      name: "田中",
    },
    isMyFriend: true,
  };

  test("encode Test", () => {
    expect(anotherUser.encode()).toEqual(json);
  });

  test("decode Test", () => {
    expect(AnotherUser.decode(json)).toEqual(anotherUser);
  });
});
