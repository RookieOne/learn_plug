defmodule MyRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  match _ do
    Plug.Conn.send_resp(conn, 200, "Hello World from Router")
  end
end
