Configuration Sample_xWebAppPool
{
    param
    (
        [parameter(Mandatory)]
        [String[]]
        $AppPoolName,

        [ValidateSet("Started", "Stopped")]
        [string]
        $state="Started",

        [String[]]
        $NodeName = 'localhost'
    )

    Import-DscResource -ModuleName xWebAdministration

    Node $NodeName
    {   
        foreach($AppPool in $AppPoolName) {
            xWebAppPool $AppPool
            {
                Name                           = $AppPoolName
                Ensure                         = 'Present'
                State                          = $state
                autoStart                      = $true
                idleTimeout                    = (New-TimeSpan -Minutes 20).ToString()  
                restartPrivateMemoryLimit      = 700000
                logEventOnRecycle              = 'Time,Memory,PrivateMemory'
            } #xWebAppPool
        } #foreach   
    } #node
} #Configuration Sample_xWebAppPool
