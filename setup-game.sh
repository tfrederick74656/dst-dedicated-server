root_dir=/home/ec2-user
mkdir $root_dir/game-app
mkdir $root_dir/game-data
mkdir $root_dir/game-lib
chmod 777 $root_dir/game-app

# Set directories and cluster name
data_dir=$root_dir/game-data
cluster_name="Cluster"

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

# Copy the download libraries script
cp download-libraries.sh $root_dir/game-lib/download-libraries.sh
chmod +x $root_dir/game-lib/download-libraries.sh

# Start the game servers
#sudo docker-compose -f docker-compose_lib.yml up
#sudo docker-compose -f docker_compose_steam.yml up
#sudo docker-compose -f docker-compose_game.yml up
