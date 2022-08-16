# NAT


## Genel

    cd nat-server
    ./delete_net.sh # onceden varsa
    ./create_net.sh

## NAT server

    cd nat-server
    ./build.sh

# NAT client

    cd nat-client
    ./build.sh

# Running

    cd nat-server
    ./run.sh
    ./connect.sh
    # run ./start.sh in docker

    cd nat-client
    ./run_interactive_1.sh 
    # run setup_1.sh in docker (once ipleri kontrol edip duzelt)
    ./run_interactive_2.sh
    # run setup_2.sh in docker (once ipleri kontrol edip duzelt)

