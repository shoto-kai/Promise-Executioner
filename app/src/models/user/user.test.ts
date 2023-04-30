import { describe, test } from "vitest";
import { User } from "~/models/user/user";

describe("User Tests", () => {
  const user = new User("1EEF20F2-6DF4-4A36-A0F4-71B16E2D525C", "田中");
  const json = {
    id: "1EEF20F2-6DF4-4A36-A0F4-71B16E2D525C",
    name: "田中",
  };

  test("encode Test", () => {
    expect(user.encode()).toEqual(json);
  });

  test("decode Test", () => {
    expect(User.decode(json)).toEqual(user);
  });
});
