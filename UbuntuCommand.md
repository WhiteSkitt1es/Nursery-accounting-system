mkdir Nursery
cd ~/Nursery
cat > home_animals
cat > pack_animals
cat home_animals pack_animals > animals
cat animals
mv animals mans_friends
ls -ali

cd ..
mkdir Nursery_system
cd ~/Nursery
mv mans_friends ~/Nursery_system
cd ~/Nursery_system
ls -ali

sudo apt install mysql-server -y
sudo apt-get update
sudo apt-get install mysql-server

sudo apt install docker.io -y
sudo dpkg -i docker.io
sudo dpkg -r docker.io
