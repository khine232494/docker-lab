Customer Profile VPC
10.0.0.0/16

subnets cidr
10.0.1.0/24 (public)
10.0.2.0/24 (public)
10.0.101.0/24 (private)
10.0.102.0/24 (private)

Account VPC
172.16.0.0/16

subnets cidr
172.16.1.0/24 (public)
172.16.2.0/24 (public)
172.16.101.0/24 (private)
172.16.102.0/24 (private)

chmod 400 customer-profile-key.pem
chmod 400 jump-host-key.pem
chmod 400 fake-service

Login to jump host
ssh -i jump-host-key.pem ec2-user@jump-hostpublicip
ssh -i jump-host-key.pem ec2-user@3.106.170.119

copy key files to jump host
scp -i jump-host-key.pem customer-profile-key.pem ec2-user@jump-hostpublicip:~
scp -i jump-host-key.pem customer-profile-key.pem ec2-user@3.106.170.119:~


To login customer profile(private vpc)
ssh -i customer-profile-key.pem ec2-user@customer-profile-private-ip
ssh -i customer-profile-key.pem ec2-user@10.0.101.31

To copy fake service to jump host
scp -i jump-host-key.pem fake-service ec2-user@3.106.170.119:~

To copy fake service to customer profile
scp -i customer-profile-key.pem fake-service ec2-user@10.0.101.31:~

chmod +x fake-service (access permission)

NAME="customer-profile" MESSAGE="Welcome to Customer Profile Service" LISTEN_ADDR="0.0.0.0:9090"  ./fake-service

NAME="customer-profile" MESSAGE="Welcome to Customer Profile Service" LISTEN_ADDR="0.0.0.0:9090" UPSTREAM_URIS="http://account.hellocloud.io" ./fake-service

Route 53 setup 
- create hosted zone in private route 53 (account.hellocloud.io)
- create load balancer in private route 53
- create record 

- nslookup (dnsname)
- sudo vim /etc/hosts
- copy the address of load balancer and add to /etc/hosts

- now you can access the service from http://customer-profile.p2khellocloud.io

-------this is the end of the customer profile service--------

-------this is the start of the account service--------
NAME="account" MESSAGE="Welcome to Account Service" LISTEN_ADDR="0.0.0.0:9090"  ./fake-service

To get access 
- First do VPC peering
- then setup Route Table
- to connect to the account service from the customer profile service
  - create a route in the route table
    - destination: account private subnet cidr (172.16.101.0/24)
    - target: peering connection (customer-profile-to-account-peering-connection)
-
