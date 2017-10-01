defmodule UserAuthenticator.Users.SessionsController do
  use UserAuthenticator.Web, :controller
  alias UserAuthenticator.Session

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    case Session.create(session_params, Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "ログインしました")
        |> redirect(to: redirect_path_after_login(conn))
      :error ->
        conn
        |> put_flash(:error, "ログインに失敗しました")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "ログアウトしました")
    |> redirect(to: redirect_path_after_logout(conn))
  end

  defp redirect_path_after_login(conn) do
    page_path(conn, :index)
  end

  defp redirect_path_after_logout(conn) do
    page_path(conn, :index)
  end
end
