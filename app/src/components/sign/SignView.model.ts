import { SignViewProps } from "~/components/sign/SignView.props";
import { SignViewState } from "~/components/sign/SignView.state";

export class SignViewModel {
  constructor(
    private readonly props: SignViewProps,
    private readonly state: SignViewState,
    private readonly setState: (s: SignViewState) => void
  ) {}

  readonly logInByGoogle = () => {
    console.log("sign in by google");
  };

  readonly logInByGitHub = () => {
    console.log("sign in by github");
  };
}
