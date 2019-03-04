# Rancher deployment on GCE

Leveraging Terraform to deploy a non-HA Rancher Server within Google Cloud

> Architecture

Terraform scripts will deploy:
* Firewall Rule
    * Allow 80 and 443 to Rancher Node only
* Rancher server (using Stable version of Rancher)

<p align="center">
  <img src="https://github.com/KellyGriffin/Rancher_GCE_Terraform/blob/master/images/RancherGCE.jpg" width="350" title="Rancher GCE Architecture">
</p>

This deployment will expose your Rancher server to the internet.  Modify the Terraform environment if you don't want this to occur.  It also provides a Dynamic Public IP Address - caution should be expressed when using a dynamic address for your Rancher server.  It is recommended a static address be used and/or a DNS entry for the Rancher URL.

## Pre-requisites
* Google Cloud Platform Account
* ssh keypair 

## Assumptions
* Defalt network will be used
* A GCE project has been created and will be used

## One time setup steps
* Clone this repo
* Modify variables.tf file as necessary with:
    * Username for SSH
    * Path to JSON File you will create below (Credentials)
    * Path to Private and Public keys for Authentication
    * Project Name
    * Confirm the location and zone are correct as they default to US Central

> Create Service Account for JSON Files (Credentials required in variables.tf file)
* Select IAM and Admin
* Click Service Accounts on the left side pane 
* Click Create Service Account 
* Provide Name as "terraform" Role as Project owner, select "Create a key" - choose JSON
* Click Create, this will download a JSON file. 
* Copy this JSON file to credentials folder and rename it as terraform.json
* If required - create public and private keys - instructions can be found [here](hhttps://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys) under Create a New SSH Key

## Execute terraform

1. [Install terraform](https://www.terraform.io/intro/getting-started/install.html)
2. Initialise Terraform by running `terraform init`
3. Check what Terraform plans to do `terraform plan`
4. Apply changes `terraform apply`

You should get the following result:
```
Outputs:

]
Rancher Server IP address = [
    Rancher server: x.x.x.x
]
```

To ensure you can get access to your Rancher server - use the IP Address shown above with HTTPS.

*Note - You will get a SSL warning due to the certificates being utilised - that is normal.*

## What to do next

> Configure Rancher

Follow the details found on our Website to configure Rancher as found [here](https://rancher.com/docs/rancher/v2.x/en/admin-settings/)

One really important note is the URL you are using for Rancher.  It's highly recommended this be a DNS based URL
Another thing worth noting - you have allocated a Dynamic IP address for your Rancher server - unless you have a DNS based URL or fronting your Rancher server with a LoadBalancer (NGINX as an example) then it's recommended that you assign a static Public IP Address.

Once complete - sit back and enjoy!!

