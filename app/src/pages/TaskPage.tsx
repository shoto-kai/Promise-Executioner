import {
  IonContent,
  IonHeader,
  IonPage,
  IonTitle,
  IonToolbar,
} from "@ionic/react";
import TaskView from "~/components/task/TaskView";
import { Task } from "~/models/task/task";
import { Restrictions } from "~/models/task/restriction/restrictions";
import { DateLimitRestriction } from "~/models/task/restriction/dateLimitRestriction";
import { Penalties } from "~/models/task/penalty/penalties";
import { SendUserPenalty } from "~/models/task/penalty/sendUserPenalty";
import { AnotherUser } from "~/models/user/anotherUser";
import { User } from "~/models/user/user";

const TaskPage: React.FC = () => {
  const tasks: readonly Task[] = [
    new Task(
      "4C0A19BA-50D2-486A-BB02-86D0211149B6",
      "数学の課題",
      "複素関数",
      new Restrictions([
        new DateLimitRestriction(
          "0E65991B-926D-46EB-A14A-57AD98F16ED2",
          new Date("2021-10-01T00:00:00.000Z")
        ),
      ]),
      new Penalties([
        new SendUserPenalty(
          "F9B42A06-B2CB-4787-B3F7-FE2130AF1479",
          new AnotherUser(
            new User("C5940CFD-D0E9-46D2-805E-8BFE7E603A57", "田中")
          ),
          "PayPay 100円",
          "https://example.com"
        ),
      ])
    ),
    new Task(
      "39B3E18F-EA12-43FF-9483-BDC44635BE47",
      "数学の課題",
      "複素関数",
      new Restrictions([
        new DateLimitRestriction(
          "A108B4E3-3627-420F-94C9-9BAAB93029B3",
          new Date("2021-10-01T00:00:00.000Z")
        ),
      ]),
      new Penalties([
        new SendUserPenalty(
          "CE218330-8949-471E-92B7-D602EBB0BC4E",
          new AnotherUser(
            new User("CB573395-DD97-4E09-BEDC-D80505ECBF3F", "田中")
          ),
          "PayPay 100円",
          "https://example.com"
        ),
      ]),
      new Date("2021-09-30T00:00:00.000Z")
    ),
    new Task(
      "67D26CD2-4B63-4F59-B8F1-28500DA726C6",
      "数学の課題",
      "複素関数",
      new Restrictions([
        new DateLimitRestriction(
          "A5893564-5FF4-4D63-8307-73E33306A072",
          new Date("2021-10-01T00:00:00.000Z")
        ),
      ]),
      new Penalties([
        new SendUserPenalty(
          "166FBEC5-AA04-44DF-B54A-866326FCCAD1",
          new AnotherUser(
            new User("2A924E9F-1FAE-4015-90FF-BA8AF1A96250", "田中")
          ),
          "PayPay 100円",
          "https://example.com"
        ),
      ]),
      new Date("2021-10-01T12:00:00.000Z"),
      new Date("2021-10-01T00:00:00.000Z")
    ),
    new Task(
      "FDD556EB-E2D3-49A7-A7C4-2EB825E0AAA5",
      "数学の課題",
      "複素関数",
      new Restrictions([
        new DateLimitRestriction(
          "55A81A2D-C9EB-4980-81A9-DA84BD924C21",
          new Date("2021-10-01T00:00:00.000Z")
        ),
      ]),
      new Penalties([
        new SendUserPenalty(
          "9EE8C2D5-9F34-46F6-A1CB-E7200BEDF3B8",
          new AnotherUser(
            new User("C986A795-77BA-41B4-91A3-CED8663729EF", "田中")
          ),
          "PayPay 100円",
          "https://example.com"
        ),
      ]),
      undefined,
      new Date("2021-10-01T00:00:00.000Z")
    ),
  ];
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Task</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Task</IonTitle>
          </IonToolbar>
        </IonHeader>
        <TaskView tasks={tasks} />
      </IonContent>
    </IonPage>
  );
};

export default TaskPage;
