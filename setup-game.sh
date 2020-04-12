# Define directory names
root_dir=/opt/dst-server
setup_dir=$root_dir/game-setup

# Create root directory
sudo mkdir $root_dir
sudo chown ec2-user:ec2-user $root_dir

# Create subdirectories
mkdir $setup_dir

# Copy scripts and config files to the setup directory
cp * $setup_dir
cd $setup_dir

# Define cluster name and cluster token
echo -n "Cluster token: "
read cluster_token
echo $cluster_token > template-cluster_token_txt.txt

# Start the game servers
#sudo docker-compose -f docker-compose_lib.yml up
#sudo docker-compose -f docker_compose_steam.yml up
#sudo docker-compose -f docker_compose_setup.yml up
#sudo docker-compose -f docker-compose_game.yml up
