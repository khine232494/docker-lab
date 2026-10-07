You must know the application will be run in which port and ip address.

- run ifconfig ( to know about the network cards of my computer )
127.0.0.1   : localhost
inet 192.168.128.113 netmask 0xffffff00 broadcast 192.168.128.255

One IP address(Network Card) can be listen to 0 to 65535 ports.

- run watch "lsof -i -P | grep dashboard" ( why add "watch" coz want to know the changes in lives)

# note 
- in my PC, can run PORT=9002 ./dashboard-service.
- First, run this command
- xattr -d com.apple.quarantine ./dashboard-service
- macOS is blocking and terminating the binary via Gatekeeper because it was downloaded from an  untrusted source and lacks an Apple developer signature.
To remove the quarantine flag directly from your terminal, run: xattr -d com.apple.quarantine ./dashboard-service
- run PORT=9002 ./dashboard-service.
- same for counting-service
- run xattr -d com.apple.quarantine ./counting-service
- run PORT=8000 ./counting-service.


- application use stable port number ( for example, localhost:9002 , localhost:8000 , localhost:8080 )
but 
- connection to the application use random port number ( for example, localhost:63025 , localhost:63030 , localhost:63035 )


Every 2.0s: lsof -i -P | grep dashboard                                   MacBookAir.internal1: Thu Sep  3 14:11:01 2026
                                                                                                          in 10.180s (0)
dashboard 32455 pwintphyukhine    4u  IPv6 0x8340bca2d3be2ca4      0t0  TCP *:8080 (LISTEN)
dashboard 32455 pwintphyukhine    8u  IPv6 0x5da33bac38e025f6      0t0  TCP localhost:8080->localhost:54327 (ESTABLISHED
)
dashboard 32455 pwintphyukhine    9u  IPv6  0x87bda3eb0b2bca6      0t0  TCP localhost:8080->localhost:54330 (ESTABLISHED
)
dashboard 32455 pwintphyukhine   10u  IPv6 0xc24524f3c08f8bd3      0t0  TCP localhost:8080->localhost:54336 (ESTABLISHED
)
dashboard 32455 pwintphyukhine   11u  IPv6  0x719edb935f6a478      0t0  TCP localhost:8080->localhost:54341 (ESTABLISHED
)
dashboard 32455 pwintphyukhine   12u  IPv6  0x773fd9ae20ffa90      0t0  TCP localhost:8080->localhost:54333 (ESTABLISHED
)



# counting-service

- counting same with backend service ( counting-service )


- run this command :
- PORT=8080 COUNTING_SERVICE_URL="http://localhost:8888" ./dashboard-service

- spof = single point of failure
- to solve this proble, we can run multiple instances of the application
