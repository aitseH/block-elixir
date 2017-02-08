defmodule Link do
  import :timer, only: [ sleep: 1]
  
  def sad_function do
    sleep 500
    exit(:boom)
  end

  # link
  def run1 do
    spawn(Link, :sad_function, [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    after 1000 ->
        IO.puts "Nothing happened as far as I am concerned"
    end
  end

  # spawn_link
  def run2 do
    spawn_link(Link, :sad_function, [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    after 1000 ->
        IO.puts "Nothing happened as far as I am concerned"
    end
  end

  # flag & spawn_link
  def run3 do
    Process.flag(:trap_exit, true)
    spawn_link(Link, :sad_function, [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    after 1000 ->
        IO.puts "Nothing happened as far as I am concerned"
    end
  end

end
