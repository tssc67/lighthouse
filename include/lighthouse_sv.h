#include <iostream>
#include "Poco/Net/Net.h"
#include "Poco/Net/TCPServer.h"
using namespace Poco::Net;
namespace Lighthouse{
    class Client_connection:public TCPServerConnection{
        public:
        Client_connection(const StreamSocket& s): TCPServerConnection(s) { }
        void run(){
            std::cout << "hello";
            std::flush(std::cout);
        }
    };
    class Server {
    public:
        void listen(int port);
    private:
        TCPServer *sv;
        SocketAddress *socket_address;
        StreamSocket *stream_socket;
    };
}