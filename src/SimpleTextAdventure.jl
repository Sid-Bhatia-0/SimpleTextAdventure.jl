module SimpleTextAdventure

import REPL
import REPL.TerminalMenus as TM
import YAML

const ESC = Char(0x1B)
const HIDE_CURSOR = ESC * "[?25l"
const SHOW_CURSOR = ESC * "[?25h"
const CLEAR_SCREEN = ESC * "[2J"
const MOVE_CURSOR_TO_ORIGIN = ESC * "[H"
const CLEAR_SCREEN_BEFORE_CURSOR = ESC * "[1J"

function create_scene_graph(file_name)
    contents = YAML.load_file(file_name)

    scene_graph = Dict{Any, Any}()

    for scene in contents["scenes"]
        scene_graph[scene["name"]] = scene
    end

    return scene_graph
end

function run_scene_graph(scene_graph, start_scene_name, end_scene_name, character_delay)
    scene_name = start_scene_name

    terminal = TM.terminal
    terminal_out = terminal.out_stream
    terminal_in = terminal.in_stream

    while scene_name != end_scene_name
        scene = scene_graph[scene_name]

        scene_text = scene["text"]
        print(terminal_out, CLEAR_SCREEN)
        print(terminal_out, MOVE_CURSOR_TO_ORIGIN)

        REPL.Terminals.raw!(terminal, true)
        Base.start_reading(terminal_in)

        for char in scene_text
            print(terminal_out, char)
            if iszero(bytesavailable(terminal_in))
                sleep(character_delay)
            end
        end

        print(terminal_out, '\n')
        print(terminal_out, '\n')
        print(terminal_out, '\n')

        read(terminal_in, bytesavailable(terminal_in))

        Base.stop_reading(terminal_in)
        REPL.Terminals.raw!(terminal, false)

        choices = scene["choices"]
        choice = TM.request(TM.RadioMenu([choice["text"] for choice in choices]))

        scene_name = choices[choice]["next_scene"]
    end

    return nothing
end

end # module
