import { useBackend } from '../backend';
import { Box, Button, Section, Stack } from '../components';
import { Window } from '../layouts';

export const MissionSelectionConsole = (props, context) => {
  const { data, act } = useBackend();

  return (
    <Window width={560} height={500}>
      <Window.Content scrollable>
        <Section title="Next mission">
          <Box color="label">
            Review the briefing and vote. A Game Master will assign the winning
            mission.
          </Box>
          {data.current_mission && (
            <Box mt={1} color="good">
              Current assignment: {data.current_mission}
            </Box>
          )}
        </Section>
        {(data.missions || []).map((mission) => (
          <Section key={mission.id} title={mission.id}>
            <Stack align="center">
              <Stack.Item grow>
                <Box style={{ whiteSpace: 'pre-wrap' }}>{mission.brief}</Box>
                <Box color="label" mt={0.5}>
                  {mission.votes} vote{mission.votes === 1 ? '' : 's'}
                </Box>
              </Stack.Item>
              <Stack.Item>
                <Button
                  color={mission.selected ? 'good' : 'blue'}
                  icon={mission.selected ? 'check' : 'vote-yea'}
                  onClick={() => act('vote_mission', { mission_id: mission.id })}
                >
                  {mission.selected ? 'Your choice' : 'Choose'}
                </Button>
              </Stack.Item>
            </Stack>
          </Section>
        ))}
        {!data.missions?.length && (
          <Section>
            <Box color="label">
              No missions are available yet. Ask a Game Master to add options.
            </Box>
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};
