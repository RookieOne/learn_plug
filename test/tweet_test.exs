defmodule LearnPlug.Test.TweetTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "should require json content-type" do
    conn = conn(:post, "/tweet", %{message: "Hi from a test tweet"})

    conn = MyRouter.call(conn, [])

    assert conn.status == 406
    assert conn.resp_body == "Wrong content type; Expected application/json"
  end

  test "should return what I just tweet'd" do
    conn = conn(:post, "/tweet", %{message: "Hi from a test tweet"})
      |> put_req_header("content-type", "application/json")

    conn = MyRouter.call(conn, [])

    assert conn.status == 200
    assert conn.resp_body == "You just tweet'd : Hi from a test tweet"
  end
end
