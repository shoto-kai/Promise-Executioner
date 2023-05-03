import { describe, test } from "vitest";
import { Restrictions } from "~/models/task/restriction/restrictions";
import { DateLimitRestriction } from "~/models/task/restriction/dateLimitRestriction";

describe("Restrictions Tests", () => {
  const restrictions = new Restrictions([
    new DateLimitRestriction(
      "555D8CCE-87BF-4C5D-BBA4-650F7E397513",
      new Date("2021-01-01T00:00:00Z")
    ),
    new DateLimitRestriction(
      "E6F6015F-ABFF-4E83-8D3E-A0782038A694",
      new Date("2021-01-02T00:00:00Z")
    ),
  ]);

  const json = {
    dateLimitRestrictions: [
      {
        id: "555D8CCE-87BF-4C5D-BBA4-650F7E397513",
        limit: "2021-01-01T00:00:00Z",
      },
      {
        id: "E6F6015F-ABFF-4E83-8D3E-A0782038A694",
        limit: "2021-01-02T00:00:00Z",
      },
    ],
  };

  test("encode Test", () => {
    expect(restrictions.encode()).toEqual(json);
  });

  test("decode Test", () => {
    expect(Restrictions.decode(json)).toEqual(restrictions);
  });
});
