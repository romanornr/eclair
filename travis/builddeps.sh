pushd .
# lightning deps
sudo add-apt-repository -y ppa:chris-lea/libsodium
sudo apt-get update
sudo apt-get install -y libsodium-dev libgmp-dev libsqlite3-dev
cd
git clone https://github.com/luke-jr/libbase58.git
cd libbase58
./autogen.sh && ./configure && make && sudo make install
# lightning
cd
git clone https://github.com/ElementsProject/lightning.git
cd lightning
git checkkout fce9ee29e3c37b4291ebb050e6a687cfaa7df95a
git submodule init
git submodule update
make
# bitcoind
cd
wget https://github.com/viacoin/viacoin/releases/download/v0.13.3.7/viacoin-0.13.3-x86_64-linux-gnu.tar.gz
echo "f95915761e0c6803697014a484da9370fbf470972f20144fd37c881207703a61  viacoin-0.13.3-x86_64-linux-gnu.tar.gz" > sha256sum.asc
sha256sum -c sha256sum.asc
tar xzvf viacoin-0.13.3-x86_64-linux-gnu.tar.gz
popd

