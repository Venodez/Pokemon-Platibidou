class GamePlayer_Event < Game_Event

    attr_reader :map_id

    def initialize(map_id, x, y, graphic_name)
        @map_id = map_id
        event = RPG::Event.new(x , y)
        event.pages[0].graphic.character_name = graphic_name
        @event_id = 1
        until $game_map.events[@event_id] == nil
            @event_id += 1
        end
        event.id = @event_id
        super(map_id, event)
        sprite = Sprite_Character.new($scene.spriteset.viewport1, self)
        $scene.spriteset.character_sprites.push(sprite)
        $game_map.events[@event_id] = self
    end
end