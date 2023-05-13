Toy Alchemist
=============

> Wizards 'n shit

## DESCRIPTION

An implementation in Elixir of the [Toy Robot coding challenge](https://leanpub.com/elixir-toyrobot)

### Background

The `Toy Alchemist` is like the `Toy Robot` but works with "potions" instead of "commands" here in Elixir land.

This was created as a demo project to be created during any "Learn Elixir" workshop. It can be used to achieve a better understanding of how the Elixir language functions and can help grep more functional programming concepts.

The workshop is built to be very collaborative and the "correct answer" could be far different from this one. This is just one of many but I felt this implementation was very approachable.

## INSTALLATION

* Install the depedencies

```
mix deps.get
```

## RUNNING

The Toy Alchemist can be currently ran as a CLI application within the terminal after the application is compiled.

```
> ./alchemist [FILE_PATH]
```

An example can be the following:

```
> ./alchemist ~/sorcery/potions.txt
```

The file path specied can be just any text file with a potion listed on each line. An example of a potion file may look like this:

```
PLACE 1,2,NORTH
MOVE
LEFT
MOVE
RIGHT
MOVE
MOVE
LEFT
REPORT
```

All potions are ignored until an alchemist is placed at a valid location within the "table". Anytime a `REPORT` potion is encountered, it displays the current location of the alchemist.

### Potions

Here are the currently supported potions.

1. `MOVE` - Moves the `Alchemist` one space in the direction they are facing. It does not perform the move if the Alchemist can fall off of the Elixir Table.
1. `LEFT` - Turns the `Alchemist` to the left of the direction they are facing.
1. `RIGHT` - Turns the `Alchemist` to the right of the direction they are facing.
1. `PLACE` - Places a new `Alchemist` at the specified position and facing the specified direction.
1. `REPORT` - Reports on the position and direction of the `Alchemist`.

## TESTING

You can run the tasks with the standard mix command:

```
mix test
```

## CONTRIBUTING

1. Clone the repository `git clone https://github.com/jwright/toy_alchemist`
1. Create a feature branch `git checkout -b my-awesome-feature`
1. Codez!
1. Commit your changes (small commits please)
1. Push your new branch `git push origin my-awesome-feature`
1. Create a pull request `gh pr create`
