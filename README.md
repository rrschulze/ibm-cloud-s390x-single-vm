# Create a single linux/s390x virtual machine on IBM Cloud
Use this repository to set up a tutorial environments with a single virtual machine with the s390x systems and processor architecture

# Create VM on s390x
On your local device, run the following commands in a terminal window:
1. `git clone https://github.com:/rrschulze/ibm-cloud-s390x-single-vm.git`
2. `cd ibm-cloud-s390x-single-vm/terraform`
3. `terraform init`
4. `terraform apply -auto-approve`
- Provide the IBM Cloud API key
- Provide your public ssh key
5. Make note of the `ipv4_address` and `ipv4_internal` values assigned to the virtual machine
6. Wait for 2 mins to allow the `cloud-init` process to be completed on the virtual machine
7. Logon to the virtual machine `ssh -l labuser <ipv4_address>`


# Run observability tools
To install prometheus, jaeger, loki and grafana, perform these steps:
1. `git clone https://github.com/rrschulze/ibm-cloud-s390x-single-vm`
2. `cd ibm-cloud-s390x-single-vm/tools`
3. `sudo docker compose up -d`
4. Verify containers are up with `sudo docker ps`