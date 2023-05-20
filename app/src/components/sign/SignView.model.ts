import { SignViewProps } from "~/components/sign/SignView.props";
import { SignViewState } from "~/components/sign/SignView.state";
import { AuthService } from "~/services/auth/firebaseAuthService";

export class SignViewModel {
  constructor(
    private readonly props: SignViewProps,
    private readonly state: SignViewState,
    private readonly setState: (s: SignViewState) => void
  ) {}

  readonly logInByGoogle = async () => {
    await this.authService.signInWithGoogle();
  };

  readonly logInByGitHub = async () => {
    await this.authService.signInWithGitHub();
  };

  private get authService(): AuthService {
    return this.props.authService;
  }
}
