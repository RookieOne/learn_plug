defmodule LogRequestPlug do
  require Logger

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    Logger.info("#{conn.method} #{conn.request_path}")
    start_time = :erlang.monotonic_time(:micro_seconds)
    register_before_send(conn, fn conn ->
      end_time = :erlang.monotonic_time(:micro_seconds)
      duration = end_time - start_time
      Logger.info("Request took #{duration} microseconds")
      conn
    end)
  end
end
