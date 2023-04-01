import REPL.TerminalMenus as TM

const ESC = Char(0x1B)
const HIDE_CURSOR = ESC * "[?25l"
const SHOW_CURSOR = ESC * "[?25h"
const CLEAR_SCREEN = ESC * "[2J"
const MOVE_CURSOR_TO_ORIGIN = ESC * "[H"
const CLEAR_SCREEN_BEFORE_CURSOR = ESC * "[1J"

function start()
    welcome_player()

    return nothing
end

function welcome_player()
    print(CLEAR_SCREEN)
    print(MOVE_CURSOR_TO_ORIGIN)

    println("Enter the name of your character:")
    character_name = readline()
    println("Welcome to this game, $(character_name)!")

    println("Press enter to continue...")
    readline()

    cave_entrance()

    return nothing
end

function cave_entrance()
    print(CLEAR_SCREEN)
    print(MOVE_CURSOR_TO_ORIGIN)

    println("You find yourself standing at the entrance to a mysterious cave. Choose wisely. Do you:")

    choices = [
        "Enter the cave to explore its secrets",
        "Turn around and run away as fast as you can",
    ]

    choice = TM.request(TM.RadioMenu(choices))

    if choice == 1
        error("Not implemented")
    elseif choice == 2
        run_into_bear()
    else
        error("Invalid choice!")
    end

    return nothing
end

function run_into_bear()
    print(CLEAR_SCREEN)
    print(MOVE_CURSOR_TO_ORIGIN)

    println("You turn around and run away as fast as you can. And you accidentally run into a bear. Do you:")

    choices = [
        "Stay calm",
        "Shout at the bear",
    ]

    choice = TM.request(TM.RadioMenu(choices))

    if choice == 1
        stay_calm()
    elseif choice == 2
        shout_at_bear()
    else
        error("Invalid choice!")
    end

    return nothing
end

function stay_calm()
    print(CLEAR_SCREEN)
    print(MOVE_CURSOR_TO_ORIGIN)

    println("You try to stay calm. And the bear looks at you and suddently places a hand on your shoulder. And tries to walk you towards the cave.")

    println("Press enter to continue...")
    readline()

    enter_cave()

    return nothing
end

function shout_at_bear()
    print(CLEAR_SCREEN)
    print(MOVE_CURSOR_TO_ORIGIN)

    println("You involuntarily shout at the bear before realizing what you just did. The bear get scared and screams, which in turn scares you and you faint thinking that the bear will attack you. The bear then picks up your body and starts carrying you towards the cave.")

    println("Press enter to continue...")
    readline()

    enter_cave()

    return nothing
end

function enter_cave()
    print(CLEAR_SCREEN)
    print(MOVE_CURSOR_TO_ORIGIN)

    println("You enter the cave and dance with bears and happy ending")

    return nothing
end

start()
