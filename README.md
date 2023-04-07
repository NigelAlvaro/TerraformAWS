# TerraformAWS

### This Module will create an EC2 instance + Security group & KeyPair, the instance can then be SSH from anywhere

For Configuration, go to config.tfvars and change the fill the necessary.

To Provision this module, run the command:
<code>terraform apply -var-file="default.tfvars"

Once provisioned the module, a keypair will be print. Make a PEM or PPK file with it.
SSH to the instance from anywhere using the PEM or PPK file as key.