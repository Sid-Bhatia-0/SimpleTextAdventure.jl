module SimpleTextAdventure

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

function run_scene_graph(scene_graph, start_scene_name, end_scene_name)
    scene_name = start_scene_name

    while scene_name != end_scene_name
        scene = scene_graph[scene_name]

        scene_text = scene["text"]

        print(CLEAR_SCREEN)
        print(MOVE_CURSOR_TO_ORIGIN)
        println(scene_text)
        println()
        println()

        choices = scene["choices"]
        choice = TM.request(TM.RadioMenu([choice["text"] for choice in choices]))

        scene_name = choices[choice]["next_scene"]
    end

    return nothing
end

end # module
