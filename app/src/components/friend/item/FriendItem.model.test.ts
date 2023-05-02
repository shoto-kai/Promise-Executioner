import { describe, test } from "vitest";
import { AnotherUser } from "~/models/user/anotherUser";
import { User } from "~/models/user/user";
import { star, starOutline } from "ionicons/icons";
import FriendItemState from "./FriendItem.state";
import FriendItemModel from "./FriendItem.model";

describe("FriendItem Model Tests", () => {
  const friend = new AnotherUser(
    new User("1EEF20F2-6DF4-4A36-A0F4-71B16E2D525C", "田中"),
    true
  );
  let state = new FriendItemState(true);
  function setState(newState: FriendItemState) {
    state = newState;
  }

  test("フレンド名の取得", () => {
    const model = new FriendItemModel({ friend }, state, setState);
    expect(model.username).toEqual("田中");
  });

  test("favoriteのアイコンはFill Iconである", () => {
    state = new FriendItemState(true);
    const model = new FriendItemModel({ friend }, state, setState);
    expect(model.icon).toEqual(star);
  });

  test("un favoriteのアイコンはOutline Iconである", () => {
    state = new FriendItemState(false);
    const model = new FriendItemModel({ friend }, state, setState);
    expect(model.icon).toEqual(starOutline);
  });

  test("favoriteの状態でclickするとun favoriteになる", () => {
    state = new FriendItemState(true);
    const model = new FriendItemModel({ friend }, state, setState);
    model.onClickStarIcon();
    expect(state.isFavorite).toBeFalsy();
  });

  test("un favoriteの状態でclickするとfavoriteになる", () => {
    state = new FriendItemState(false);
    const model = new FriendItemModel({ friend }, state, setState);
    model.onClickStarIcon();
    expect(state.isFavorite).toBeTruthy();
  });
});
