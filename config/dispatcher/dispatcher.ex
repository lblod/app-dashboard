defmodule Dispatcher do
  use Plug.Router

  def start(_argv) do
    port = 80
    IO.puts "Starting Plug with Cowboy on port #{port}"
    Plug.Adapters.Cowboy.http __MODULE__, [], port: port
    :timer.sleep(:infinity)
  end

  plug Plug.Logger
  plug :match
  plug :dispatch

  ###############################################################
  # master-log-domain.lisp
  ###############################################################

  match "/log-entries/*path" do
    Proxy.forward conn, path, "http://resource/log-entries/"
  end

  match "/log-levels/*path" do
    Proxy.forward conn, path, "http://resource/log-levels/"
  end

  match "/status-codes/*path" do
    Proxy.forward conn, path, "http://resource/status-codes/"
  end

  match "/log-sources/*path" do
    Proxy.forward conn, path, "http://resource/log-sources/"
  end

  match "/status-codes/*path" do
    Proxy.forward conn, path, "http://resource/acm-idm-service-log-entries/"
  end

  match _ do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end

end
