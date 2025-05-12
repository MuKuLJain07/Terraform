# Terraform
Terraform is an Infrastructure as Code (IaC) tool developed by HashiCorp that allows users to define and manage infrastructure as code.Terraform automates the process of creating, modifying, and deleting infrastructure resources, making it easier to manage and scale infrastructure in a consistent and repeatable manner. 

#### Terraform vs Ansible
Terraform and Ansible are both powerful tools used in infrastructure automation, but they serve distinct purposes. Terraform excels at provisioning and managing infrastructure, while Ansible is primarily used for configuration management and automation tasks on that infrastructure.

#### CloudFormation
CloudFormation is like a terraform for AWS infrastructure. CloudFormation provide some pre defined templates.

### Installing Terraform
[Click here to visit official documentation of terraform](https://developer.hashicorp.com/terraform/install)

---
## Terraform HCL (HashiCorp configuration language) --> Syntax
Terraform files have .tf file extension

### Basic Syntax:
```
<block> <parameters> {
    
    <argument-1>
    <argument-2>
    <argument-3>....
    
}
```

### Types of Block in Terraform :-

| Blocks   |
|----------|
| Resource |
| Variable |
| Output   |

### Terraform Workflow :-
1. Create file with .tf extension
2. Initialize terraform: `terraform init`
3. Check syntax: `terraform validate`
4. Dry run you .tf file: `terraform plan`
5. Execute .tf file finally: `terraform apply`
6. Destroy Resouces using terraform: `terraform destroy`

Note: You can use `terraform apply -auto-approve` to skip approval asked by terraform before creating or destroying resources.

Ex -
```
resource "local_file" "my_file" {
    filename = "automated.txt"
    content = "This is an automated file created by Terraform."
    file_permission = "777"
}
```


here,
1. local -> provider name, which you can find on https://registry.terraform.io/namespaces/hashicorp
2. file -> resource type
3. my_file -> resource name
4. filenamem, content, file_permission -> arguments


### EC2 instance
