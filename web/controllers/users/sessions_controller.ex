defmodule UserAuthenticator.Users.SessionsController do
  use UserAuthenticator.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
