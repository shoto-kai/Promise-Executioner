import { describe, test } from "vitest";
import FriendItemState from "~/components/friend/item/FriendItem.state";

describe("FavoriteItem State Tests", () => {
  test("toggleIsFavoriteで、isFavoriteをfalseならばtrueにしたものを返せる", () => {
    const expected = new FriendItemState(true);
    const actual = new FriendItemState(false).toggleIsFavorite;
    expect(actual).toEqual(expected);
  });

  test("toggleIsFavoriteで、isFavoriteをtrueならばfalseにしたものを返せる", () => {
    const expected = new FriendItemState(false);
    const actual = new FriendItemState(true).toggleIsFavorite;
    expect(actual).toEqual(expected);
  });
});
