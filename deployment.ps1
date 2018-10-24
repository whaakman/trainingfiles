# Basic information
$region1 = "West Europe"
$region2 = "West Europe"
$rg1 = "rg-Training-VM1"
$rg2 = "rg-Training-VM2"
$rg3 = "rg-Training-VM3"
$templateFile = "C:\Users\whaak\OneDrive\Documenten\code\Training\Templates\azuredeploy.json"

# Provision Resource Groups
New-AzResourceGroup -Location $region1 -Name $rg1 -Force
New-AzResourceGroup -Location $region1 -Name $rg2 -Force
New-AzResourceGroup -Location $region2 -Name $rg3 -Force


# Deploy Template 1
$dnsLabel = "trainingintercept-" + -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
$parameters = @{
    adminUsername = "intercept"
    adminPassword = "Welkom01Welkom01!"
}
$parameters.Add('dnsLabelPrefix', $dnsLabel.ToLower())

New-AzResourceGroupDeployment -ResourceGroupName $rg1 -TemplateFile $templateFile -TemplateParameterObject $parameters -Verbose


# Deploy Template 2
$dnsLabel = "trainingintercept-" + -join ((65..90) + (97..122) | Get-Random -Count 6 | % {[char]$_})
$parameters2 = @{
    adminUsername = "intercept"
    adminPassword = "Welkom01Welkom01!"
}
$parameters2.Add('dnsLabelPrefix', $dnsLabel.ToLower())

New-AzResourceGroupDeployment -ResourceGroupName $rg2 -TemplateFile $templateFile -TemplateParameterObject $parameters2 -Verbose


# Deploy Template 3
$dnsLabel = "trainingintercept-" + -join ((65..90) + (97..122) | Get-Random -Count 7 | % {[char]$_})
$parameters3 = @{
    adminUsername = "intercept"
    adminPassword = "Welkom01Welkom01!"
}
$parameters3.Add('dnsLabelPrefix', $dnsLabel.ToLower())

New-AzResourceGroupDeployment -ResourceGroupName $rg3 -TemplateFile $templateFile -TemplateParameterObject $parameters3 -Verbose