# Define directory names
root_dir=/opt/dst-server
app_dir=$root_dir/game-app
data_dir=$root_dir/game-data
lib_dir=$root_dir/game-lib
setup_dir=$root_dir/game-setup

# Create root directory
sudo mkdir $root_dir
sudo chown ec2-user:ec2-user $root_dir

# Create subdirectories
mkdir $app_dir
mkdir $data_dir
mkdir $lib_dir
mkdir $setup_dir
chmod 777 $app_dir

# Copy scripts and config files to the setup directory
cp * $setup_dir
cd $setup_dir

# Define cluster name and cluster token
cluster_name="Cluster"
echo -n "Cluster token: "
read cluster_token
echo $cluster_token > template-cluster_token_txt.txt

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

# Copy the download libraries script
cp download-libraries.sh $lib_dir/download-libraries.sh
chmod +x $lib_dir/download-libraries.sh

# Start the game servers
#sudo docker-compose -f docker-compose_lib.yml up
#sudo docker-compose -f docker_compose_steam.yml up
#sudo docker-compose -f docker-compose_game.yml up
