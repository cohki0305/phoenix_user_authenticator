defmodule UserAuthenticator.PageController do
  use UserAuthenticator.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
