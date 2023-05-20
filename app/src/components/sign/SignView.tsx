import { useState, useMemo } from "react";
import { SignViewState as State } from "~/components/sign/SignView.state";
import { SignViewProps as Props } from "~/components/sign/SignView.props";
import { SignViewModel as Model } from "~/components/sign/SignView.model";

export default function SignView({ props }: { props: Props }) {
  const [state, setState] = useState(State.init);
  const m = useMemo(() => new Model(props, state, setState), [props, state]);
  return (
    <>
      <button onClick={m.logInByGoogle}>Googleでログイン</button>
      <button onClick={m.logInByGitHub}>GitHubでログイン</button>
    </>
  );
}
