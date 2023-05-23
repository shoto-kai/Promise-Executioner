import {
  signInWithPopup,
  Auth,
  AuthProvider,
  GoogleAuthProvider,
  GithubAuthProvider,
} from "firebase/auth";

export interface AuthService {
  signInWithGoogle(): Promise<string>;
  signInWithGitHub(): Promise<string>;
}

export class FirebaseAuthService implements AuthService {
  constructor(private readonly auth: Auth) {}
  async signInWithGoogle() {
    return await this.signIn(new GoogleAuthProvider());
  }

  async signInWithGitHub() {
    return await this.signIn(new GithubAuthProvider());
  }

  private async signIn(provider: AuthProvider): Promise<string> {
    const result = await signInWithPopup(this.auth, provider);
    if (result.user.email == null) {
      throw new Error("Email is null");
    }
    return result.user.email;
  }
}
