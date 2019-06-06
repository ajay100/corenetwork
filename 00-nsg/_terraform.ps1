### logging via az cli
### az login --service-principal -u %TF_VAR_client_id% -p %TF_VAR_client_secret% -t %TF_VAR_tenant_id%

$phase      = "nsg"
$rg_name    = "000-MS-POC-RG-EASTUS"
$sa_name    = "terraformstatems"
$cnt_name   = "tf-state-dev"
$access_key =  az storage account keys list -g terraformstate -n $sa_name --query "[0].value"
$key        = "csr/$phase/$phase.tfstate"

terraform init `
    -backend-config="access_key=$access_key" `
    -backend-config="resource_group_name=$rg_name" `
    -backend-config="storage_account_name=$sa_name" `
    -backend-config="container_name=$cnt_name" `
    -backend-config="key=$key" 


#terraform plan -var-file="..\variables.tfvars"
#terraform apply -var-file="..\variables.tfvars" -auto-approve
#terraform destroy -var-file="..\variables.tfvars" -auto-approve
