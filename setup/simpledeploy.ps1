$ResourceGroupLocation = 'westeurope'
$ResourceGroupName = 'azure-eventing-demo'
$TemplateFile = 'azuredeploy.json'
$TemplateParametersFile = 'azuredeploy.parameters.json'

# Create or update the resource group using the specified template file and template parameters file
New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation -Force

Test-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile $TemplateFile -TemplateParameterFile $TemplateParametersFile -Mode Incremental

New-AzureRmResourceGroupDeployment -Name ((Get-ChildItem $TemplateFile).BaseName + '-' + ((Get-Date).ToUniversalTime()).ToString('MMdd-HHmm')) `
                                    -ResourceGroupName $ResourceGroupName `
                                    -TemplateFile $TemplateFile `
                                    -TemplateParameterFile $TemplateParametersFile `
                                    -Force -Verbose `
                                    -Mode Incremental 
