Connect-AzAccount

# required variables

$resourceName = "Final_Project"
$location = "West US"
$WebAppName_server= "FPApp_server"
$WebAppName= "finalproject-webapp"

$adminSqlLogin = "cmpe363"
$password = "Meca1234"

#$MysubscriptionId = ''
Set-AzContext -SubscriptionId 88e623fd-6077-48f4-996d-b149cbf93006

$serverName = "finalproject-cmpe363"
$databaseName = "DB_FinalProject"


#create a resource group

New-AzResourceGroup -Name $resourceName -Location $location


#create web app and service


New-AzAppServicePlan -Name $WebAppName_server -Location $location -ResourceGroupName $resourceName -Tier D1
New-AzWebApp -Name $WebAppName -Location $location -AppServicePlan $WebAppName_server -ResourceGroupName $resourceName


#create SQL database server &  firewall rules

New-AzSqlServer -ResourceGroupName $resourceName ` -ServerName $serverName ` -Location $location ` -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminSqlLogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force))
New-AzSqlServerFirewallRule -ResourceGroupName $resourceName ` -ServerName $serverName ` -FirewallRuleName "AllowedIPs" -StartIpAddress 0.0.0.0 -EndIpAddress 0.0.0.0

#create empty SQL database

New-AzSqlDatabase  -ResourceGroupName $resourceName ` -ServerName $serverName ` -DatabaseName $databaseName ` -RequestedServiceObjectiveName "S0"

#connect database with the web app

Set-AzWebApp -ConnectionStrings @{ ConnectionString = @{ Type="SQLAzure"; Value ="Server=tcp:$serverName.database.windows.net;Database=$databaseName;User ID=$adminSqlLogin@$ServerName;Password=$password;Trusted_Connection=False;Encrypt=True;" } } -Name $WebAppName -ResourceGroupName $resourceName



