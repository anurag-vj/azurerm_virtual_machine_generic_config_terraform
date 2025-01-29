# Azure Virtual Machine Generic Configuration with Terraform

This repository contains Terraform configurations for deploying a generic virtual machine on Azure.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An Azure account with the necessary permissions to create resources.

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/azurerm_virtual_machine_generic_config_terraform.git
    cd azurerm_virtual_machine_generic_config_terraform
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Validate the Terraform configuration:
    ```sh
    terraform validate
    ```

4. Review and modify the `variables.tf` file to customize the configuration as needed.

5. Plan the Terraform deployment:
    ```sh
    terraform plan
    ```

6. Apply the Terraform configuration:
    ```sh
    terraform apply
    ```

7. Confirm the apply action with `yes`.

8. Verify the deployment by checking the outputs:
    ```sh
    terraform output
    ```

9. To make changes to the configuration, modify the necessary files and re-run:
    ```sh
    terraform plan
    terraform apply
    ```


## Variables

The following variables can be configured in the `variables.tf` file:

- `resource_group_name`: The name of the resource group.
- `location`: The Azure region where the resources will be deployed.
- `vm_name`: The name of the virtual machine.
- `vm_size`: The size of the virtual machine.
- `admin_username`: The admin username for the virtual machine.
- `admin_password`: The admin password for the virtual machine.

## Outputs

The following outputs will be provided after the deployment:

- `vm_id`: The ID of the virtual machine.
- `public_ip`: The public IP address of the virtual machine.

## Cleanup

To destroy the resources created by this configuration, run:
```sh
terraform destroy
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss any changes.