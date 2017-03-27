defmodule LogRequestPlug do
  require Logger

  def init(opts), do: opts

  def call(conn, _opts) do
    Logger.info("#{conn.method} #{conn.request_path}")
    conn
  end
end
