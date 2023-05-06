module SimpleTextAdventureApp

import SimpleTextAdventure as STA

function julia_main()::Cint
    story_file_name = ARGS[1]

    scene_graph, animation_delay = STA.create_scene_graph(story_file_name)

    STA.run_scene_graph(scene_graph, animation_delay)

    return 0
end

end # module SimpleTextAdventureApp
