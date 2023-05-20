import {
  signInWithPopup,
  Auth,
  AuthProvider,
  GoogleAuthProvider,
  GithubAuthProvider,
} from "firebase/auth";

export interface AuthService {
  signInWithGoogle(): Promise<void>;
  signInWithGitHub(): Promise<void>;
}

export class FirebaseAuthService implements AuthService {
  constructor(private readonly auth: Auth) {}
  async signInWithGoogle() {
    await this.signIn(new GoogleAuthProvider());
  }

  async signInWithGitHub() {
    await this.signIn(new GithubAuthProvider());
  }

  private async signIn(provider: AuthProvider) {
    try {
      const result = await signInWithPopup(this.auth, provider);
      console.log(result.user);
    } catch (error) {
      console.error("Error SignIn", error);
    }
  }
}
