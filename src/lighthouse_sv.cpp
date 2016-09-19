#include <iostream>
#include "lighthouse_sv.h"
namespace Lighthouse{
    void Server::listen(int port){
        sv = new TCPServer(
            new TCPServerConnectionFactoryImpl<Client_connection>(),
            port
        );
        sv->start();
    }
}