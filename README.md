# SimpleTextAdventure.jl

A simple game engine to create text adventure games.

Stories are configured in yaml files. See `examples/story.yaml` for how to create a story. It is essentially a list of scenes with each scene having a `name`, some `text`, and a list of `choices`, where each choice has a `text` and a `next_scene` corresponding to that choice.

The engine simply runs the state machine where each state is a scene and the actions are the choices that the player can make in that scene. Selecting a choice will take you to its corresponding next scene.

## Getting started

To play the demo game

1. Clone the repository

```
git clone https://github.com/Sid-Bhatia-0/SimpleTextAdventure.jl.git
```

1. Go to the `examples` directory and run the julia REPL

```
julia --project=.
```

1. Instantiate the project after going into `Pkg` mode by pressing `]`

```
(examples) pkg> instantiate
```

1. Exit the REPL and run the following command in the `examples` directory

```
julia --project=. play.jl story.yaml
```

This will start the game inside the terminal.
