import { describe, expect } from "vitest";
import { AppTask, AppTaskState } from "~/models/task/task";

describe("Task Tests", () => {
  test("初期値のテスト", () => {
    const id = crypto.randomUUID();
    const expected = new AppTask(
      id,
      "",
      "",
      0,
      AppTaskState.incomplete,
      undefined
    );
    const actual = AppTask.init(id);
    expect(actual).toEqual(expected);
  });
});
