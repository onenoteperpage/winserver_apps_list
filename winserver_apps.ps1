# Set TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Set JSON download file URL
$url = "https://raw.githubusercontent.com/onenoteperpage/winserver_apps_list/main/apps.json"

# Read JSON content from the web
$response = Invoke-WebRequest -Uri $url

# Convert JSON content to a PowerShell object
$appList = $response.Content | ConvertFrom-Json

# Define a function to list all apps
function Get-WSAppsList {
    # Access the global $appList variable
    $global:appList.PSObject.Properties | ForEach-Object {
        Write-Output $_.Name
    }
}

# Define a function to list all apps urls
function Get-WSAppsListUrls {
    $global:appList.PSObject.Properties | ForEach-Object {
        Write-Output $_.Value.url
    }
}

# Call the function to list all apps
Get-WSAppsList

# Call the function to list all apps urls
Get-WSAppsListUrls