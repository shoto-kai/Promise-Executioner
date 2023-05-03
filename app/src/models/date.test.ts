import { describe, test, expect } from "vitest";
import { decodeDate, encodeDate } from "~/models/date";

describe("Date Tests", () => {
  test("Date encode JSON Test", () => {
    const date = new Date("2021-08-01T18:00:00+09:00");
    const expected = "2021-08-01T09:00:00Z";
    const actual: string = encodeDate(date);
    expect(actual).toBe(expected);
  });

  test("undefined encode JSON Test", () => {
    expect(encodeDate(undefined)).toBeUndefined();
  });

  test("Date decode Test", () => {
    const expected = new Date("2021-08-01T18:00:00+09:00");
    const actual = decodeDate("2021-08-01T09:00:00Z");
    expect(actual).toEqual(expected);
  });

  test("undefined decode Test", () => {
    expect(decodeDate(undefined)).toBeUndefined();
  });
});
