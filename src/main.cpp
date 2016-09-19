#include "lighthouse_sv.h"
#include <iostream>
#include <stdio.h>
int main(){
    printf("suns");
    Lighthouse::Server sv;
    sv.listen(2121);
    while(true){
        std::flush(std::cout);
        sleep(1);
    }
    return 0;
}