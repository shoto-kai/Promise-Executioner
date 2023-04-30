import { describe, test } from "vitest";
import { Restrictions } from "~/models/task/restriction/restrictions";
import { DateLimitRestriction } from "~/models/task/restriction/dateLimitRestriction";

describe("Restrictions Tests", () => {
  const restrictions = new Restrictions([
    new DateLimitRestriction(1, new Date("2021-01-01T00:00:00.000Z")),
    new DateLimitRestriction(2, new Date("2021-01-02T00:00:00.000Z")),
  ]);

  const json = {
    dateLimitRestrictions: [
      {
        id: 1,
        limit: "2021-01-01T00:00:00.000Z",
      },
      {
        id: 2,
        limit: "2021-01-02T00:00:00.000Z",
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
