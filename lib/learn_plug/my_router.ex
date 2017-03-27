defmodule MyRouter do
  use Plug.Router

  import Plug.Conn

  plug :match
  plug :dispatch

  match "/howdy" do
    Plug.Conn.send_resp(conn, 200, "Howdy")
  end

  get "/widgets" do
    Plug.Conn.send_resp(conn, 200, "Return widgets")
  end

  post "/widgets" do
    Plug.Conn.send_resp(conn, 200, "Add widget")
  end

  post "/tweet" do
    conn = fetch_query_params(conn)
    %{"message" => tweet} = conn.params
    send_resp(conn, 200, "You just tweet'd : " <> tweet)
  end

  match _ do
    Plug.Conn.send_resp(conn, 200, "Hello World from Router")
  end
end
