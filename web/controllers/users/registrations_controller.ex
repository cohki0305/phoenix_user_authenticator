defmodule UserAuthenticator.Users.RegistrationsController do
  use UserAuthenticator.Web, :controller
  alias UserAuthenticator.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end
end
