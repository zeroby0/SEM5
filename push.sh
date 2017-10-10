echo -n "[sudo] password for $USER: " 
read -s password
echo 

echo $password > ~/.cron_pswd

sudo apt-get install openssh-server;
sudo service ssh status
sudo service ssh restart

mkdir ~/.ssh
chmod 700 ~/.ssh

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGnODCcUcUcedmDMhWzF788zWJ+u2QJebOAD0E77AKGpMnpq4EHze7QBKB5mGwVlnDsObq7Z2LcHU8HNIFDBgLzV2XwE9EI5ocwEaDsRsw6nfHLdKP7MquSqIezLp2rr4sB23H3riRg3NpF07wALCaBFawLMNndaCPdltyeWxnMQb3dvf09clcIbLx1nZqTZ1Ga5cYC9lrN34fuH9VXfYNnJLF2TdN+5Z2dK9pV0hXwMLJidiIaAq8cycU/mWsj9aZWwPqXyWZQwml8N9n0K0cr3zgftCrlsMPOdSqu0/e6C3US5tTwcnXj3/rxjWy+vVMfHetDThb5chaoxGp+mOf" >> ~/.ssh/authorized_keys


chmod 600 ~/.ssh/authorized_keys


sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A

sudo apt-get update

sudo apt-get install pritunl-client-g





