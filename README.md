# TerraformAWS

This Module will create an EC2 instance + Security group & KeyPair, the instance can then be SSH from anywhere
To Configure Credential, go to variables.tf and change the "region", "access_key", and "secret_key"
To Provision this module, run the command "Terraform Apply", then:
  - input OS type ("linux", "windows", or "ubuntu")
  - input Prefix (This could be any name)
Once provisioned the module, a keypair will be print. Make a PEM or PPK file with it.
SSH to the instance from anywhere using the PEM or PPK file as key.
