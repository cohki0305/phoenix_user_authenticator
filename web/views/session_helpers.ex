defmodule UserAuthenticator.SessionHelpers do
  alias UserAuthenticator.Repo
  alias UserAuthenticator.User
  import Plug.Conn
    @doc """
    return current user logged in
  """
  def current_user(conn) do
    id = get_session(conn, :current_user)
    if id, do: User |> Repo.get(id)
  end

  @doc """
   check whether user login in
  """
  def logged_in?(conn) do
    !!current_user(conn)
  end
end
