# New Content 2021-01-09
readonly CLUSTER_INI='; Cluster Configuration

[MISC]
max_snapshots = 128
console_enabled = true

[SHARD]
shard_enabled = true
cluster_key = <cluster_key>
master_ip = master
; BInd IP must be set for containers to talk to one another
bind_ip = 0.0.0.0

[STEAM]
steam_group_only = false

[NETWORK]
cluster_name = Cluster
cluster_description = This is a test server
cluster_intention = cooperative
autosaver_enabled = true

[GAMEPLAY]
max_players = 16
pvp = false
game_mode = survival
pause_when_empty = true
vote_enabled = false
'

readonly CAVES_LEVELDATAOVERRIDE_LUA='return {
  background_node_range={ 0, 1 },
  desc="Delve into the caves... together!",
  hideminimap=false,
  id="DST_CAVE",
  location="cave",
  max_playlist_position=999,
  min_playlist_position=0,
  name="The Caves",
  numrandom_set_pieces=0,
  override_level_string=false,
  overrides={
    banana="default",
    bats="default",
    berrybush="default",
    boons="default",
    branching="default",
    bunnymen="default",
    cave_ponds="default",
    cave_spiders="default",
    cavelight="default",
    chess="default",
    disease_delay="default",
    earthquakes="default",
    fern="default",
    fissure="default",
    flint="default",
    flower_cave="default",
    grass="default",
    layout_mode="RestrictNodesByKey",
    lichen="default",
    liefs="default",
    loop="default",
    marshbush="default",
    monkey="default",
    mushroom="default",
    mushtree="default",
    prefabswaps_start="default",
    reeds="default",
    regrowth="default",
    roads="never",
    rock="default",
    rocky="default",
    sapling="default",
    season_start="default",
    slurper="default",
    slurtles="default",
    start_location="caves",
    task_set="cave_default",
    tentacles="default",
    touchstone="default",
    trees="default",
    weather="default",
    world_size="default",
    wormattacks="default",
    wormhole_prefab="tentacle_pillar",
    wormlights="default",
    worms="default" 
  },
  required_prefabs={ "multiplayer_portal" },
  substitutes={  },
  version=4 
}'

readonly CAVES_MODOVERRIDES_LUA='return {  }
'

readonly CAVES_SERVER_INI='[NETWORK]
server_port = 11000

[SHARD]
is_master = false
name = Caves

[STEAM]
authentication_port = 8766
master_server_port = 27016
'

readonly MASTER_LEVELDATAOVERRIDE_LUA='return {
  desc="The standard Don'"'"'t Starve experience.",
  hideminimap=false,
  id="SURVIVAL_TOGETHER",
  location="forest",
  max_playlist_position=999,
  min_playlist_position=0,
  name="Default",
  numrandom_set_pieces=4,
  override_level_string=false,
  overrides={
    alternatehunt="default",
    angrybees="default",
    antliontribute="default",
    autumn="default",
    bearger="default",
    beefalo="default",
    beefaloheat="default",
    bees="default",
    berrybush="default",
    birds="default",
    boons="default",
    branching="default",
    butterfly="default",
    buzzard="default",
    cactus="default",
    carrot="default",
    catcoon="default",
    chess="default",
    day="default",
    deciduousmonster="default",
    deerclops="default",
    disease_delay="default",
    dragonfly="default",
    flint="default",
    flowers="default",
    frograin="default",
    goosemoose="default",
    grass="default",
    has_ocean=true,
    houndmound="default",
    hounds="default",
    hunt="default",
    keep_disconnected_tiles=true,
    krampus="default",
    layout_mode="LinkNodesByKeys",
    liefs="default",
    lightning="default",
    lightninggoat="default",
    loop="default",
    lureplants="default",
    marshbush="default",
    merm="default",
    meteorshowers="default",
    meteorspawner="default",
    moles="default",
    mushroom="default",
    no_joining_islands=true,
    no_wormholes_to_disconnected_tiles=true,
    penguins="default",
    perd="default",
    petrification="default",
    pigs="default",
    ponds="default",
    prefabswaps_start="default",
    rabbits="default",
    reeds="default",
    regrowth="default",
    roads="default",
    rock="default",
    rock_ice="default",
    sapling="default",
    season_start="default",
    specialevent="default",
    spiders="default",
    spring="default",
    start_location="default",
    summer="default",
    tallbirds="default",
    task_set="default",
    tentacles="default",
    touchstone="default",
    trees="default",
    tumbleweed="default",
    walrus="default",
    weather="default",
    wildfires="default",
    winter="default",
    world_size="default",
    wormhole_prefab="wormhole" 
  },
  random_set_pieces={
    "Sculptures_2",
    "Sculptures_3",
    "Sculptures_4",
    "Sculptures_5",
    "Chessy_1",
    "Chessy_2",
    "Chessy_3",
    "Chessy_4",
    "Chessy_5",
    "Chessy_6",
    "Maxwell1",
    "Maxwell2",
    "Maxwell3",
    "Maxwell4",
    "Maxwell6",
    "Maxwell7",
    "Warzone_1",
    "Warzone_2",
    "Warzone_3" 
  },
  required_prefabs={ "multiplayer_portal" },
  required_setpieces={ "Sculptures_1", "Maxwell5" },
  substitutes={  },
  version=4 
}'

readonly MASTER_MODOVERRIDES_LUA='return {  }
'

readonly MASTER_SERVER_INI='[NETWORK]
server_port = 10999

[SHARD]
is_master = true

[STEAM]
authentication_port = 8766
master_server_port = 27016
'

readonly DATA_DIR=/root/game-data
# TODO Move to environmental variables via Docker
readonly CLUSTER_NAME=Cluster
readonly CLUSTER_TOKEN_TXT='**************************************************************'

# Make game data directory structure
mkdir -p $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/Master
mkdir -p $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/Caves

# Copy in the cluster token
echo "$CLUSTER_TOKEN_TXT" > $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/cluster_token.txt

# Copy in the cluster.ini file, and generate a random cluster key
echo "$CLUSTER_INI" > $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/cluster.ini
readonly CLUSTER_KEY=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
sed -i "s/<cluster_key>/$CLUSTER_KEY/g" $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/cluster.ini

# Copy in the server.ini files
echo "$MASTER_SERVER_INI" > $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/Master/server.ini
echo "$CAVES_SERVER_INI" > $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/Caves/server.ini

# Copy in default level configs
echo "$MASTER_LEVELDATAOVERRIDE_LUA" > $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/Master/leveldataoverride.lua
echo "$CAVES_LEVELDATAOVERRIDE_LUA" > $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/Caves/leveldataoverride.lua

# Copy in config files for mods
echo "$MASTER_MODOVERRIDES_LUA" > $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/Master/modoverrides.lua
echo "$CAVES_MODOVERRIDES_LUA" > $DATA_DIR/DoNotStarveTogether/$CLUSTER_NAME/Caves/modoverrides.lua