defmodule ParseJsonPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    with {:ok, body, conn} <- read_body(conn),
      {:ok, body_params} <- Poison.decode(body) do
      %{conn | body_params: body_params, params: Map.merge(conn.params, body_params)}
    else
      _ -> conn
    end
  end
end
