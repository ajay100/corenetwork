### az login --service-principal -u %TF_VAR_client_id% -p %TF_VAR_client_secret% -t %TF_VAR_tenant_id%


$access_key = "DAzT5knI7Z+zIb+D9NB3b1lHr1Ny49L15BoSKGIATNqyqXH+mRrpGfXfTsE8fUMQLIuL26dU+kVHo0ubfnYElA=="
$rg_name    = "000-MS-POC-RG-EASTUS"
$sa_name    = "terraformstatems"
$cnt_name   = "tf-state-dev"
$key        = "key=csr/vms03/vms03.tfstate"

terraform init `
    -backend-config="access_key=$access_key" `
    -backend-config="resource_group_name=$rg_name" `
    -backend-config="storage_account_name=$sa_name" `
    -backend-config="container_name=$cnt_name" `
    -backend-config="key=$key" 


#terraform plan -var-file="..\variables.tfvars"
#terraform apply -var-file="..\variables.tfvars" -auto-approve
#terraform destroy -var-file="..\variables.tfvars" -auto-approve