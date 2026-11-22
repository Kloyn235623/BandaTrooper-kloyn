import { useState } from 'react';

import { useBackend } from '../backend';
import { Box, Button, Section, Stack, Tabs } from '../components';
import { Window } from '../layouts';

export const MissionHubTrader = (props, context) => {
  const { data, act } = useBackend();
  const [tab, setTab] = useState('buy');

  return (
    <Window width={500} height={560} theme="ntos">
      <Window.Content scrollable>
        <Section
          title={data.trader_role || 'Mission Trader'}
          color="good"
          buttons={<Box color="good">SHIP SUPPLY NETWORK</Box>}>
          <Box color="label" mb={1}>
            Equipment exchange · physical cash only
          </Box>
          <Tabs>
            <Tabs.Tab
              selected={tab === 'buy'}
              onClick={() => setTab('buy')}>
              Buy
            </Tabs.Tab>
            <Tabs.Tab
              selected={tab === 'sell'}
              onClick={() => setTab('sell')}>
              Sell
            </Tabs.Tab>
          </Tabs>
          {data.can_manage && (
            <Box color="good" mt={1}>
              GM: hold an item and click this person to list it. Set price to 0 to remove it.
            </Box>
          )}
          <Stack vertical mt={1}>
            {(tab === 'buy' ? data.offers : data.sellables)?.map((entry) => (
              <Stack.Item key={entry.ref || entry.path}>
                <Section level={2}>
                  <Stack align="center">
                    <Stack.Item grow>
                      <Box bold color="good">
                        {entry.name}
                      </Box>
                    </Stack.Item>
                    <Stack.Item>
                      <Box color="label">${entry.price}</Box>
                    </Stack.Item>
                    <Stack.Item>
                      <Button
                        color="good"
                        icon={tab === 'buy' ? 'cart-plus' : 'cash-register'}
                        onClick={() =>
                          act(tab, tab === 'buy' ? { path: entry.path } : { ref: entry.ref })
                        }>
                        {tab === 'buy' ? 'Purchase' : 'Sell'}
                      </Button>
                    </Stack.Item>
                    {tab === 'buy' && data.can_manage && (
                      <Stack.Item>
                        <Button
                          color="bad"
                          icon="trash"
                          onClick={() => act('remove_offer', { path: entry.path })}
                        />
                      </Stack.Item>
                    )}
                  </Stack>
                </Section>
              </Stack.Item>
            ))}
            {!(tab === 'buy' ? data.offers : data.sellables)?.length && (
              <Stack.Item>
                <Box color="label" textAlign="center" mt={3}>
                  {tab === 'buy'
                    ? 'No equipment is currently listed.'
                    : 'No listed items in your inventory.'}
                </Box>
              </Stack.Item>
            )}
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
