# LearnPlug

An example filled repo from a brown bag presentation for my team mates at Everydayhero.

## Hello World

To start the HelloWorldPlug from iex use:

```
> Plug.Adapters.Cowboy.http(HelloWorldPlug, [])
```

To start the HelloWorldPlug from application use:

```
  children = [
    # Starts a worker by calling: LearnPlug.Worker.start_link(arg1, arg2, arg3)
    # worker(LearnPlug.Worker, [arg1, arg2, arg3]),
    Plug.Adapters.Cowboy.child_spec(:http, HelloWorldPlug, [])
  ]
```

And run the mix app with: `mix run --no-halt`
