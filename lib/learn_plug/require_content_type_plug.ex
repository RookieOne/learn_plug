defmodule RequireContentTypePlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, content_type: required_content_type) do
    case get_req_header(conn, "content-type") do
      [content_type] when content_type == required_content_type ->
        conn
      _ ->
        conn
        |> send_resp(406, "Wrong content type; Expected #{required_content_type}")
        |> halt
    end
  end
end
