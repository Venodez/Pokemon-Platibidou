class GamePlayer_Event < Game_Event

    attr_reader :map_id

    def initialize(map_id, x, y, graphic_name)
        @map_id = map_id
        event = RPG::Event.new(x , y)
        event.pages[0].graphic.character_name = graphic_name
        event_id = 1
        until $game_map.events[event_id] == nil
            event_id += 1
        end
        event.id = event_id
        $game_map.events[event_id] = self
        super(map_id, event)
        $scene.spriteset.reload(zone=map_id)
    end
end