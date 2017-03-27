defmodule FetchPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    fetch_query_params(conn)
  end
end
