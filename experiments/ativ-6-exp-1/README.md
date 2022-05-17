# Assignment 06

## Create a Security Group

The first step is to create a security group:

- Use EC2 service.
- On the side bar menu, above the "Network and Security" menu select "Security Groups".
- Click on "Create Security Group".
    - Give a name.
    - Give a description.
    - Add a new rule.
        - Type: All traffic
        - Protocol: All
        - Port Range: All
        - Source: The Security Group just created

For the students who have the AWS Unicamp account access, it is possible to use the the already create manuel_mpi security group.

## Create a Instance

The second step is create an instance:

- Use EC2 service.
- On the EC2 panel select "Launch an Instace".
- In this new page, select "My AMIs" and choose the DCGAN V2 Image.
    - This image has all the necessary tools and directory to build DCGAN Distributed application (It will be available only fo the Unicamp Students account).
- Intance Type: t2.medium (A test was done with the t2.micro and it did not work).
- Key Pair (Chose one or create a new one).
- Network Configuration: Edit and choose the Security Group previously created
- Select 2 for the number of isntances (You may choose more than 2, but for use all, you will need change the script's arguments for the application execution).

## Run Application

The third step is to access the instance and run the application.
- Access the machines using the ssh protocol and the ssh key pair generated in the previous steps (log as ubuntu user).
- In both (or more) machines access this directory (/home/ubuntu/Distributed-DCGAN/experiments/ativ-6-exp-1)
```console
$ cd Distributed-DCGAN/experiments/ativ-6-exp-1
```
- Run the application on the first machine via script:
```console
$ ./run.sh [MASTER_IP] 0 2
```
Replace [MASTER_IP] with the first machine's IP

- Run the application on the second machine via script:
```console
$ ./run.sh [MASTER_IP] 1 2
```
Use the firs machine IP. Remark that the second argument has changed because it is the rank number, and there is a rank number for each instace.

- For more machines repeat the last step incrementing the second argument and the number of node (third argument) must change for all the machines with the number of nodes/machines/instances used to run the application.

## How the script works

```console
$ ./run.sh [MASTER_IP] [RANK] [NUMBER OF NODES]
```
- MASTER_IP: The IP from the rank 0 machine (The master one).
- RANK: The Rank number indicator of the machine
- NUMBER OF NODES: The number of nodes/machines used to run the application