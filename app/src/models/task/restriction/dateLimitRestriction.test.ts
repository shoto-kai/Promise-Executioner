import { describe, test } from "vitest";
import { DateLimitRestriction } from "~/models/task/restriction/dateLimitRestriction";

describe("DateLimitRestriction Tests", () => {
  const restriction = new DateLimitRestriction(
    1,
    new Date("2021-01-01T00:00:00.000Z")
  );

  const json = {
    id: 1,
    limit: "2021-01-01T00:00:00.000Z",
  };

  test("encode Test", () => {
    expect(restriction.encode()).toEqual(json);
  });

  test("decode Test", () => {
    expect(DateLimitRestriction.decode(json)).toEqual(restriction);
  });
});
