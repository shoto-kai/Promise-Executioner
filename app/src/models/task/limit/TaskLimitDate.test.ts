import { describe } from "vitest";
import { TaskLimitDate } from "~/models/task/limit/TaskLimitDate";

describe("TaskLimitDate Tests", () => {
  test("5分20秒前ならば、05分20秒と返す", () => {
    const limit = new TaskLimitDate(new Date("2020-01-01T00:05:20.000Z"));
    const now = new Date("2020-01-01T00:00:00.000Z");

    expect(limit.restTime(now)).toBe("05分20秒");
  });

  test("1時間24分前ならば、01時間24分と返す", () => {
    const limit = new TaskLimitDate(new Date("2020-01-01T01:24:00.000Z"));
    const now = new Date("2020-01-01T00:00:00.000Z");
    expect(limit.restTime(now)).toBe("01時間24分");
  });

  test("1日と3時間45分3秒前ならば、1日03時間this.lessThanMinutesUnitRestTimeText(now)と返す", () => {
    const limit = new TaskLimitDate(new Date("2020-01-02T03:45:03.000Z"));
    const now = new Date("2020-01-01T00:00:00.000Z");
    expect(limit.restTime(now)).toBe("1日03時間");
  });
});
