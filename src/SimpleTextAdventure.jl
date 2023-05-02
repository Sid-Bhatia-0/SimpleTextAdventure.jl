module SimpleTextAdventure

import REPL.Terminals as Terminals
import REPL.TerminalMenus as TM
import YAML

const ESC = Char(0x1B)
const CLEAR_SCREEN = ESC * "[2J"
const MOVE_CURSOR_TO_ORIGIN = ESC * "[H"

function create_scene_graph(file_name)
    contents = YAML.load_file(file_name)

    scene_graph = Dict{Any, Any}()

    for scene in contents["scenes"]
        scene_graph[scene["name"]] = scene
    end

    return scene_graph
end

function run_scene_graph(scene_graph, start_scene_name, end_scene_name, animation_delay)
    terminal = TM.terminal
    terminal_out = terminal.out_stream
    terminal_in = terminal.in_stream

    current_scene_name = start_scene_name

    while current_scene_name != end_scene_name
        current_scene = scene_graph[current_scene_name]

        current_scene_text = current_scene["text"]
        print(terminal_out, CLEAR_SCREEN)
        print(terminal_out, MOVE_CURSOR_TO_ORIGIN)

        Terminals.raw!(terminal, true)
        Base.start_reading(terminal_in)

        for char in current_scene_text
            print(terminal_out, char)
            if iszero(bytesavailable(terminal_in))
                sleep(animation_delay)
            end
        end

        print(terminal_out, '\n')
        print(terminal_out, '\n')
        print(terminal_out, '\n')

        read(terminal_in, bytesavailable(terminal_in))

        Base.stop_reading(terminal_in)
        Terminals.raw!(terminal, false)

        current_scene_choices = current_scene["choices"]
        selected_choice = TM.request(TM.RadioMenu([choice["text"] for choice in current_scene_choices]))

        current_scene_name = current_scene_choices[selected_choice]["next_scene"]
    end

    return nothing
end

end # module
