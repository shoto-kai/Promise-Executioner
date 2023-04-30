import { describe } from "vitest";
import { none, some } from "~/models/task/restriction/restrictionLimit";

describe("制約期限日のTests", () => {
  test("noneの場合、isBeforeはfalseになる", () => {
    const someDay = some(new Date("2020-12-01"));
    expect(none.isBefore(someDay)).toBeFalsy();
    expect(none.isBefore(none)).toBeFalsy();
  });

  test("someの場合のisBeforeのテスト", () => {
    const earlier = some(new Date("2020-12-01"));
    const later = some(new Date("2020-12-02"));
    expect(earlier.isBefore(later)).toBeTruthy();
    expect(later.isBefore(earlier)).toBeFalsy();
    expect(earlier.isBefore(earlier)).toBeFalsy();
    expect(later.isBefore(none)).toBeTruthy();
  });

  test("noneの場合、mapはundefinedを返す", () => {
    const actual = none.map((d) => d.getMonth() + 1 + "月");
    expect(actual).toBeUndefined();
  });

  test("someの場合、mapはコールバックの結果を返す", () => {
    const actual = some(new Date("2020-12-01")).map((d) => {
      return d.getMonth() + 1 + "月";
    });
    expect(actual).toBe("12月");
  });

  test("noneの場合、getOrElseはデフォルト値を返す", () => {
    const actual = none.getOrElse(new Date("2020-01-01"));
    expect(actual).toEqual(new Date("2020-01-01"));
  });

  test("someの場合、getOrElseは値を返す", () => {
    const actual = some(new Date("2020-12-01")).getOrElse(
      new Date("2020-01-01")
    );
    expect(actual).toEqual(new Date("2020-12-01"));
  });

  test("noneの場合、orElseはデフォルト値を返す", () => {
    const actual = none.orElse(new Date("2020-01-01"));
    expect(actual).toEqual(some(new Date("2020-01-01")));
  });

  test("someの場合、orElseは値を返す", () => {
    const actual = some(new Date("2020-12-01")).orElse(new Date("2020-01-01"));
    expect(actual).toEqual(some(new Date("2020-12-01")));
  });
});
