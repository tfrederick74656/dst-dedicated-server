data_dir=/root/game-data
cluster_name=Cluster

# Make game data directory structure
mkdir -p $data_dir/DoNotStarveTogether/$cluster_name/Master
mkdir -p $data_dir/DoNotStarveTogether/$cluster_name/Caves

# Copy in the cluster.ini file, and generate a random cluster key
cluster_key=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
cat template-cluster_ini.txt > $data_dir/DoNotStarveTogether/$cluster_name/cluster.ini
sed -i "s/<cluster_key>/$cluster_key/g" $data_dir/DoNotStarveTogether/$cluster_name/cluster.ini

# Copy in the serve.ini files
cp template-master-server_ini.txt $data_dir/DoNotStarveTogether/$cluster_name/Master/server.ini
cp template-caves-server_ini.txt $data_dir/DoNotStarveTogether/$cluster_name/Caves/server.ini

# Copy in the cluster token
cp template-cluster_token_txt.txt $data_dir/DoNotStarveTogether/$cluster_name/cluster_token.txt

# Copy in default level configs
cp template-master-leveldataoverride_lua.txt $data_dir/DoNotStarveTogether/$cluster_name/Master/leveldataoverride.lua
cp template-caves-leveldataoverride_lua.txt $data_dir/DoNotStarveTogether/$cluster_name/Caves/leveldataoverride.lua
