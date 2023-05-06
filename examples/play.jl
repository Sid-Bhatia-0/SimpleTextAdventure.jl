import SimpleTextAdventure as STA

const story_file_name = ARGS[1]

const scene_graph, animation_delay = STA.create_scene_graph(story_file_name)

STA.run_scene_graph(scene_graph, animation_delay)
