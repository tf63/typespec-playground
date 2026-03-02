import "@typespec/http";

using Http;
namespace ApiService;

model User {
  id: string;
  name: string;
  email: string;
  role: "admin" | "user" | "guest";
}

model UserList {
  items: User[];
}

@error
model Error {
  code: int32;
  message: string;
}

model UserProfile {
  id: string;
  profile: string;
}

@route("/users")
@tag("Users")
interface Users {
  /** List users */
  @get list(): UserList | Error;
  /** Read user */
  @get read(@path id: string): User | Error;
  /** Create a user */
  @post create(@body body: User): User | Error;
  /** Update a user */
  @patch update(@path id: string, @body body: MergePatchUpdate<User>): User | Error;
  /** Delete a user */
  @delete delete(@path id: string): void | Error;

  /** Get user profile */
  @route("{id}/profile") @get getProfile(@path id: string): UserProfile | Error;
}
