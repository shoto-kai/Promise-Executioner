import { SignViewProps } from "~/components/sign/SignView.props";
import { SignViewState } from "~/components/sign/SignView.state";
import { AuthService } from "~/services/auth/firebaseAuthService";
import { UseIonRouterResult } from "@ionic/react";

export class SignViewModel {
  constructor(
    private readonly props: SignViewProps,
    private readonly state: SignViewState,
    private readonly setState: (s: SignViewState) => void,
    private readonly router: UseIonRouterResult
  ) {}

  readonly logInByGoogle = async () => {
    try {
      const email = await this.authService.signInWithGoogle();
      console.log(email);
      this.router.push("/task");
    } catch (e) {
      console.error(e);
    }
  };

  readonly logInByGitHub = async () => {
    try {
      const email = await this.authService.signInWithGitHub();
      console.log(email);
      this.router.push("/task");
    } catch (e) {
      console.error(e);
    }
  };

  private get authService(): AuthService {
    return this.props.authService;
  }
}
