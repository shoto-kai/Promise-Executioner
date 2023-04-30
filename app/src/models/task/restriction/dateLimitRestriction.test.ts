import { describe, test } from "vitest";
import { DateLimitRestriction } from "~/models/task/restriction/dateLimitRestriction";

describe("DateLimitRestriction Tests", () => {
  const restriction = new DateLimitRestriction(
    "47F87916-435C-47A6-8E9C-513AEF7D3A52",
    new Date("2021-01-01T00:00:00.000Z")
  );

  const json = {
    id: "47F87916-435C-47A6-8E9C-513AEF7D3A52",
    limit: "2021-01-01T00:00:00.000Z",
  };

  test("encode Test", () => {
    expect(restriction.encode()).toEqual(json);
  });

  test("decode Test", () => {
    expect(DateLimitRestriction.decode(json)).toEqual(restriction);
  });
});
