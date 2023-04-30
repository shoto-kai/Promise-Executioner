import { describe } from "vitest";
import { Task } from "~/models/task/task";
import { Restrictions } from "~/models/task/restriction/restrictions";
import { DateLimitRestriction } from "~/models/task/restriction/dateLimitRestriction";
import { Penalties } from "~/models/task/penalty/penalties";
import { SendUserPenalty } from "~/models/task/penalty/sendUserPenalty";
import { AnotherUser } from "~/models/user/anotherUser";
import { User } from "~/models/user/user";

describe("Task Tests", () => {
  const task = new Task(
    "4774DD61-245D-4D7B-B64A-A85107419AA4",
    "BBQ集合時間",
    "BBQ集合時間は18:00です",
    new Restrictions([
      new DateLimitRestriction(
        "D3B8116F-54FA-4568-8750-D30CFDC72342",
        new Date("2021-08-01T18:00:00+09:00")
      ),
    ]),
    new Penalties([
      new SendUserPenalty(
        "DC4F1FEA-8C79-418D-B6BA-E5ADD633D037",
        new AnotherUser(
          new User("B45E919E-9CAD-4956-AF61-AFE9F32C47E2", "田中"),
          false
        ),
        "PayPay 500円",
        "https://example.com"
      ),
    ])
  );

  const json = {
    id: "4774DD61-245D-4D7B-B64A-A85107419AA4",
    title: "BBQ集合時間",
    note: "BBQ集合時間は18:00です",
    restrictions: {
      dateLimitRestrictions: [
        {
          id: "D3B8116F-54FA-4568-8750-D30CFDC72342",
          limit: "2021-08-01T09:00:00.000Z",
        },
      ],
    },
    penalties: {
      sendUserPenalties: [
        {
          id: "DC4F1FEA-8C79-418D-B6BA-E5ADD633D037",
          destinationUser: {
            user: {
              id: "B45E919E-9CAD-4956-AF61-AFE9F32C47E2",
              name: "田中",
            },
            isMyFriend: false,
          },
          note: "PayPay 500円",
          content: "https://example.com",
        },
      ],
    },
  };

  test("encode Test", () => {
    expect(task.encode()).toEqual(json);
  });

  test("decode Test", () => {
    expect(Task.decode(json)).toEqual(task);
  });
});
