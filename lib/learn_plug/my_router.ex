defmodule MyRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  match "/howdy" do
    Plug.Conn.send_resp(conn, 200, "Howdy")
  end

  match _ do
    Plug.Conn.send_resp(conn, 200, "Hello World from Router")
  end
end
