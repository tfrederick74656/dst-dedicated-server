# Formerly download-game.sh
download_game () { 
    chown steam:steam /home/steam/download
    su steam
    /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/download +app_update 343050 validate +quit
}

# Formerly download-libraries.sh
download_libraries () { 
    # Define paths for working and target directories
    working_dir=/root/download
    target_dir=/root/libraries

    # Define the packages to be downloaded and the dependency copy command
    copy_command="cp -L --preserve=timestamp"
    library_list="libc6 libcom-err2 libcurl3-gnutls libgcc1 libgssapi-krb5-2 libidn2-0 libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libldap-2.4-2 libnghttp2-14 libnspr4 libnss3 libpcre3 libsasl2-2 libselinux1 libssh2-1 libssl1.1 libstdc++6 libunistring2 zlib1g libffi6 libgcrypt20 libgmp10 libgnutls30 libgpg-error0 libhogweed4 libnettle6 libp11-kit0 libpsl5 librtmp1 libtasn1-6"

    # Create the working directory and move there. The target directory will be bind-mounted in.
    mkdir $working_dir
    cd $working_dir

    # Update sources
    apt-get update

    # Download all packages
    apt-get download $library_list

    # Extract the .deb package files
    for f in *.deb; do dpkg-deb -x $f .; done

    # Copy library files to target directory
    $copy_command $working_dir/lib/i386-linux-gnu/libm.so.6 $target_dir/libm.so.6
    $copy_command $working_dir/lib/i386-linux-gnu/libc.so.6 $target_dir/libc.so.6
    $copy_command $working_dir/lib/ld-linux.so.2 $target_dir/ld-linux.so.2
    $copy_command $working_dir/lib/i386-linux-gnu/libdl.so.2 $target_dir/libdl.so.2
    $copy_command $working_dir/lib/i386-linux-gnu/libresolv.so.2 $target_dir/libresolv.so.2
    $copy_command $working_dir/lib/i386-linux-gnu/libcrypt.so.1 $target_dir/libcrypt.so.1
    $copy_command $working_dir/lib/i386-linux-gnu/librt.so.1 $target_dir/librt.so.1
    $copy_command $working_dir/lib/i386-linux-gnu/libpthread.so.0 $target_dir/libpthread.so.0
    $copy_command $working_dir/lib/i386-linux-gnu/libcom_err.so.2 $target_dir/libcom_err.so.2
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libcurl-gnutls.so.4 $target_dir/libcurl-gnutls.so.4
    $copy_command $working_dir/lib/i386-linux-gnu/libgcc_s.so.1 $target_dir/libgcc_s.so.1
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libgssapi_krb5.so.2 $target_dir/libgssapi_krb5.so.2
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libidn2.so.0 $target_dir/libidn2.so.0
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libk5crypto.so.3 $target_dir/libk5crypto.so.3
    $copy_command $working_dir/lib/i386-linux-gnu/libkeyutils.so.1 $target_dir/libkeyutils.so.1
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libkrb5.so.3 $target_dir/libkrb5.so.3
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libkrb5support.so.0 $target_dir/libkrb5support.so.0
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libldap-2.4.so.2 $target_dir/libldap-2.4.so.2
    $copy_command $working_dir/usr/lib/i386-linux-gnu/liblber-2.4.so.2 $target_dir/liblber-2.4.so.2
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libnghttp2.so.14 $target_dir/libnghttp2.so.14
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libplds4.so $target_dir/libplds4.so
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libplc4.so $target_dir/libplc4.so
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libnspr4.so $target_dir/libnspr4.so
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libssl3.so $target_dir/libssl3.so
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libsmime3.so $target_dir/libsmime3.so
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libnss3.so $target_dir/libnss3.so
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libnssutil3.so $target_dir/libnssutil3.so
    $copy_command $working_dir/lib/i386-linux-gnu/libpcre.so.3 $target_dir/libpcre.so.1
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libsasl2.so.2 $target_dir/libsasl2.so.3
    $copy_command $working_dir/lib/i386-linux-gnu/libselinux.so.1 $target_dir/libselinux.so.1
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libssh2.so.1 $target_dir/libssh2.so.1
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libssl.so.1.1 $target_dir/libssl.so.10
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libcrypto.so.1.1 $target_dir/libcrypto.so.10
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libstdc++.so.6 $target_dir/libstdc++.so.6
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libunistring.so.2 $target_dir/libunistring.so.0
    $copy_command $working_dir/lib/i386-linux-gnu/libz.so.1 $target_dir/libz.so.1
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libgnutls.so.30 $target_dir/libgnutls.so.30
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libldap_r-2.4.so.2 $target_dir/libldap_r-2.4.so.2
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libnettle.so.6 $target_dir/libnettle.so.6
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libpsl.so.5 $target_dir/libpsl.so.5
    $copy_command $working_dir/usr/lib/i386-linux-gnu/librtmp.so.1 $target_dir/librtmp.so.1
    $copy_command $working_dir/lib/i386-linux-gnu/libgpg-error.so.0 $target_dir/libgpg-error.so.0
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libffi.so.6 $target_dir/libffi.so.6
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libgmp.so.10 $target_dir/libgmp.so.10
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libhogweed.so.4 $target_dir/libhogweed.so.4
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libp11-kit.so.0 $target_dir/libp11-kit.so.0
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libtasn1.so.6 $target_dir/libtasn1.so.6
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libunistring.so.2 $target_dir/libunistring.so.2
    $copy_command $working_dir/usr/lib/i386-linux-gnu/libsasl2.so.2 $target_dir/libsasl2.so.2
    $copy_command $working_dir/lib/i386-linux-gnu/libgcrypt.so.20 $target_dir/libgcrypt.so.20
    $copy_command $working_dir/lib/i386-linux-gnu/libnss_dns-2.28.so $target_dir/libnss_dns.so.2
}

# Formerly initialize-data.sh
initialize_data () { 
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
}

case "$1" in
	download_game) download_game;;
	download_libraries) download_libraries;;
  initialize_data) initialize_data;;
	*) exit 1;;
esac
