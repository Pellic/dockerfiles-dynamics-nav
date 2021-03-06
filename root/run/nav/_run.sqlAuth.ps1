[CmdletBinding()]
param (

)

. (Join-Path $PSScriptRoot '_createlinks.ps1')
. (Join-Path $PSScriptRoot '_presetvars.ps1')

# --hostname => Option in this case.
# --name => Optional but usefull to identify the container.
# --restart => Change or remove restart policy if needed.
# --label => These flags are not necessary, update them if interested or delete them in other case.
# -p => Port mapping (host-range:container-range).

$containerId = docker run -d --hostname=NAVSERVER --name=navserver `
    -p 7045-7049:7045-7049 `
    -v $PSScriptRoot\Add-ins:'C:\Program Files\Microsoft Dynamics NAV\Service\Add-ins\Docker-Share' `
    -e "sql_server=sql_ip\sql_instance" -e "sql_db=navdbname" -e "sql_user=user" -e "sql_pwd=pwd" `
    -e "nav_user=navuser" -e "nav_user_pwd=pwd" -e "import_cronus_license=false" -e "config_instance=false" `
    --restart=always `
    --label com.mycompany.container-type=navserver `
    --label com.mycompany.navserver-version=2016/2017 `
    --label com.mycompany.navserver-cu=1/2../X `
    ${repo}/${navImageNameSql}

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $containerId
