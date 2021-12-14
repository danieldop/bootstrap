if type git > /dev/null; then
    git clone git@github.com:danieldop/bootstrap.git ~/bootstrap
    chmod +x ~/bootstrap
    cd ~/bootstrap
    ./bootstrap.sh
else
    curl -LO https://github.com/danieldop/bootstrap/archive/master.zip
    unzip master.zip
    rm -rf master.zip
    mv bootstrap-master ~/bootstrap
    chmod +x ~/bootstrap
    cd ~/bootstrap
    ./bootstrap.sh
fi
