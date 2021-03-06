defmodule MyRouter do
  use Plug.Router

  import Plug.Conn

  plug Plug.Logger
  plug FetchPlug
  plug RequireContentTypePlug, content_type: "application/json"
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    json_decoder: Poison

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
    %{"message" => tweet} = conn.params
    send_resp(conn, 200, "You just tweet'd : " <> tweet)
  end

  match _ do
    Plug.Conn.send_resp(conn, 200, "Hello World from Router")
  end
end
