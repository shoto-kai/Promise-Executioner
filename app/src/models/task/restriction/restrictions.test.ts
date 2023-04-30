import { describe, test } from "vitest";
import { Restrictions } from "~/models/task/restriction/restrictions";
import { DateLimitRestriction } from "~/models/task/restriction/dateLimitRestriction";
import { some } from "~/models/task/restriction/restrictionLimit";

describe("Restrictions Tests", () => {
  const restrictions = new Restrictions([
    new DateLimitRestriction(
      "555D8CCE-87BF-4C5D-BBA4-650F7E397513",
      new Date("2021-01-01T00:00:00.000Z")
    ),
    new DateLimitRestriction(
      "E6F6015F-ABFF-4E83-8D3E-A0782038A694",
      new Date("2021-01-02T00:00:00.000Z")
    ),
  ]);

  const json = {
    dateLimitRestrictions: [
      {
        id: "555D8CCE-87BF-4C5D-BBA4-650F7E397513",
        limit: "2021-01-01T00:00:00.000Z",
      },
      {
        id: "E6F6015F-ABFF-4E83-8D3E-A0782038A694",
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

  test("全て完了済みであれば isCompletedがtrueを返す", () => {
    const restrictions = new Restrictions([
      new DateLimitRestriction(
        "555D8CCE-87BF-4C5D-BBA4-650F7E397513",
        new Date("2021-01-01T00:00:00.000Z"),
        new Date("2020-12-31T00:00:00.000Z")
      ),
      new DateLimitRestriction(
        "E6F6015F-ABFF-4E83-8D3E-A0782038A694",
        new Date("2021-01-02T00:00:00.000Z"),
        new Date("2021-01-01T00:00:00.000Z")
      ),
    ]);
    expect(restrictions.isCompleted).toBeTruthy();
  });

  test("1つでも未達成であれば isCompletedがfalseを返す", () => {
    const restrictions = new Restrictions([
      new DateLimitRestriction(
        "555D8CCE-87BF-4C5D-BBA4-650F7E397513",
        new Date("2021-01-01T00:00:00.000Z"),
        new Date("2020-12-31T00:00:00.000Z")
      ),
      new DateLimitRestriction(
        "E6F6015F-ABFF-4E83-8D3E-A0782038A694",
        new Date("2021-01-02T00:00:00.000Z"),
        new Date("2021-01-03T00:00:00.000Z")
      ),
    ]);
    expect(restrictions.isCompleted).toBeFalsy();
  });

  test("最も期限が前の未達成の期限を返す", () => {
    const restrictions = new Restrictions([
      // 達成済み 1/1
      new DateLimitRestriction(
        "555D8CCE-87BF-4C5D-BBA4-650F7E397513",
        new Date("2021-01-01T00:00:00.000Z"),
        new Date("2020-12-31T00:00:00.000Z")
      ),
      // 失敗 1/2
      new DateLimitRestriction(
        "E6F6015F-ABFF-4E83-8D3E-A0782038A694",
        new Date("2021-01-02T00:00:00.000Z"),
        new Date("2021-01-03T00:00:00.000Z")
      ),
      // 1/4
      new DateLimitRestriction(
        "E6F6015F-ABFF-4E83-8D3E-A0782038A694",
        new Date("2021-0-04T00:00:00.000Z")
      ),
      // 1/3
      new DateLimitRestriction(
        "E6F6015F-ABFF-4E83-8D3E-A0782038A694",
        new Date("2021-01-02T00:00:00.000Z")
      ),
    ]);

    expect(restrictions.earliestLimit).toEqual(
      // 1/2
      some(new Date("2021-01-02T00:00:00.000Z"))
    );
  });
});
