defmodule HelloWorldPlug do

  def init(opts), do: opts

  def call(conn, _opts) do
    Plug.Conn.send_resp(conn, 200, "Hello World")
  end
end
