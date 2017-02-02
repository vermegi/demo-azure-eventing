Param(
    [string] $ResourceGroupLocation = 'westeurope',
    [string] $ResourceGroupName = 'azure-eventing-demo',
    [string] $TemplateFile = 'azuredeploy.json',
    [string] $TemplateParametersFile = 'azuredeploy.parameters.json',
    [string] $Branch = 'master'
)

# Create or update the resource group using the specified template file and template parameters file
New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation -Force

Test-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile $TemplateFile -TemplateParameterFile $TemplateParametersFile -Mode Incremental

New-AzureRmResourceGroupDeployment -Name ((Get-ChildItem $TemplateFile).BaseName + '-' + ((Get-Date).ToUniversalTime()).ToString('MMdd-HHmm')) `
                                    -ResourceGroupName $ResourceGroupName `
                                    -TemplateFile $TemplateFile `
                                    -TemplateParameterFile $TemplateParametersFile `
                                    -Branch $Branch
                                    -Force -Verbose `
                                    -Mode Incremental 
