import { useBackend } from '../backend';
import {
  Box,
  Button,
  Collapsible,
  Divider,
  Dropdown,
  Section,
  Slider,
  Stack,
} from '../components';
import { Window } from '../layouts';

export const GameMaster = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Window width={400} height={500}>
      <Window.Content scrollable>
        <Stack direction="column" grow>
          <GameMasterSpawningPanel />

          <GameMasterBehaviorPanel />

          <GameMasterObjectivePanel />

          <GameMasterMissionHubPanel />

          <GameMasterCommunicationPanel />

          <GameMasterRecordPanel />
        </Stack>
      </Window.Content>
    </Window>
  );
};

export const GameMasterMissionHubPanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="Mission Hub">
      <Stack vertical>
        <Stack.Item>
          Current mission: {data.current_hub_mission || 'None selected'}
        </Stack.Item>
        <Stack.Item>
          <Box color="label" mb={0.5}>Choose the human NPC to place:</Box>
          <Dropdown
            options={data.hub_trader_profiles}
            selected={data.selected_hub_trader_profile}
            onSelected={(profile) => act('set_hub_trader_profile', { profile })}
          />
          <Button onClick={() => act('place_hub_trader')}>
            Place selected trader
          </Button>
          <Button onClick={() => act('place_hub_stash')}>
            Place group supply locker
          </Button>
          <Button onClick={() => act('place_hub_mission_console')}>
            Place mission selection console
          </Button>
          <Button onClick={() => act('queue_hub_mission')}>
            Add mission to queue
          </Button>
          <Button
            color="good"
            onClick={() => act('advance_hub_mission')}
            disabled={!data.mission_queue?.length}
          >
            Complete task & start next
          </Button>
        </Stack.Item>
        <Stack.Item>
          <Box color="label">
            Select a profile, click “Place selected trader”, then click a tile on the map.
          </Box>
        </Stack.Item>
        {(data.mission_queue || []).map((mission_id, index) => (
          <Stack.Item key={`${mission_id}-${index}`}>
            {index + 1}. {mission_id}
            <Button
              color="bad"
              onClick={() => act('remove_hub_mission', { mission_id })}
            >
              Remove
            </Button>
          </Stack.Item>
        ))}
        <Stack.Item mt={1}>
          <Section title="Group supply stock">
            {(data.group_stash_stock || []).map((entry) => (
              <Stack key={entry.type} align="center">
                <Stack.Item grow>{entry.name}</Stack.Item>
                <Stack.Item>
                  {entry.count} available{entry.total_worth ? ` · $${entry.total_worth}` : ''}
                </Stack.Item>
                <Stack.Item>
                  <Button
                    color="good"
                    onClick={() => act('issue_group_stash_item', { item_type: entry.type })}>
                    Issue to group
                  </Button>
                </Stack.Item>
              </Stack>
            ))}
            {!data.group_stash_stock?.length && (
              <Box color="label">The shared locker is empty.</Box>
            )}
          </Section>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const GameMasterSpawningPanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="Spawning">
      <Stack direction="column">
        <Stack.Item>
          <Button onClick={() => act('open_human_squad_spawner')}>
            Human Squads (including IASF)
          </Button>
        </Stack.Item>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Button.Input
                ml={1}
                minWidth={3.5}
                minHeight={1.5}
                currentValue={data.xeno_spawn_count}
                onCommit={(e, value) => {
                  act('set_xeno_spawns', { value });
                }}
              >
                {data.xeno_spawn_count}
              </Button.Input>
            </Stack.Item>
            <Stack.Item>
              <Dropdown
                options={data.spawnable_xenos}
                selected={data.selected_xeno}
                onSelected={(new_xeno) => {
                  act('set_selected_xeno', { new_xeno });
                }}
                menuWidth="10rem"
                width="10rem"
              />
            </Stack.Item>
            <Stack.Item>
              <Dropdown
                options={data.spawnable_hives}
                selected={data.selected_hive}
                onSelected={(new_hive) => {
                  act('set_selected_hive', { new_hive });
                }}
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Button.Checkbox
                checked={data.spawn_ai}
                onClick={() => {
                  act('xeno_spawn_ai_toggle');
                }}
              >
                AI
              </Button.Checkbox>
            </Stack.Item>
            <Stack.Item>
              <Button
                selected={data.spawn_click_intercept}
                onClick={() => {
                  act('toggle_click_spawn');
                }}
              >
                Click Spawn
              </Button>
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item>
          <Stack>
            <Stack.Item>
              <Button
                onClick={() => {
                  act('delete_all_xenos');
                }}
              >
                Delete all xenos
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button
                onClick={() => {
                  act('delete_xenos_in_view');
                }}
              >
                Delete viewed xenos
              </Button>
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const GameMasterBehaviorPanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="Special Behaviors">
      <Stack direction="column">
        <Stack.Item>
          <Dropdown
            ml={1}
            options={data.selectable_behaviors}
            selected={data.selected_behavior}
            onSelected={(new_behavior) => {
              act('set_selected_behavior', { new_behavior });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Button
            selected={data.behavior_click_intercept}
            onClick={() => {
              act('toggle_click_behavior');
            }}
          >
            Click Behavior
          </Button>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const GameMasterObjectivePanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="Objective" mb={1}>
      <Stack direction="column">
        <Stack.Item>
          <Button
            ml={1}
            selected={data.objective_click_intercept}
            onClick={() => {
              act('toggle_click_objective');
            }}
          >
            Click Objective
          </Button>
        </Stack.Item>
        {data.game_master_objectives && (
          <Stack.Item>
            <Collapsible title="Objectives">
              <Stack vertical>
                {data.game_master_objectives.map((val) => {
                  if (val) {
                    return (
                      <Stack.Item key={val.object_name}>
                        <Divider />
                        <Stack>
                          <Stack.Item align="center">
                            <Button
                              onClick={() => {
                                act('jump_to', { val });
                              }}
                            >
                              {val.object_name}
                            </Button>
                          </Stack.Item>
                          <Stack.Item>
                            <Button
                              color="bad"
                              onClick={() => {
                                act('remove_objective', { val });
                              }}
                            >
                              X
                            </Button>
                          </Stack.Item>
                          <Stack.Item grow pl={1} py={0.25} fontSize="12px">
                            {val.objective_info}
                          </Stack.Item>
                        </Stack>
                      </Stack.Item>
                    );
                  }
                })}
                <Divider />
              </Stack>
            </Collapsible>
          </Stack.Item>
        )}
      </Stack>
    </Section>
  );
};

export const GameMasterCommunicationPanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="Communication">
      <Stack direction="column">
        <Stack.Item>
          <Button
            ml={1}
            onClick={() => {
              act('use_game_master_phone');
            }}
          >
            Game Master Phone
          </Button>
        </Stack.Item>
        <Stack.Item mt={1}>Radio Clarity</Stack.Item>
        <Stack.Item>
          <Slider
            maxValue={100}
            minValue={0}
            value={data.radio_clarity}
            stepPixelSize={3}
            suppressFlicker={2500}
            onChange={(e, clarity) => {
              act('set_radio_clarity', { clarity });
            }}
          />
        </Stack.Item>
        <Stack.Item>
          <Box fontFamily="monospace">{`"${data.radio_clarity_example}"`}</Box>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const GameMasterRecordPanel = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Section title="Records">
      <Stack.Item>
        <Button
          ml={1}
          selected={data.record_create_click_intercept}
          onClick={() => {
            act('toggle_click_record_creation');
          }}
        >
          Create record for person on click
        </Button>
      </Stack.Item>
    </Section>
  );
};
