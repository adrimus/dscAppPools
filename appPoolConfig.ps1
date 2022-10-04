Configuration Sample_xWebAppPool
{
    param
    (
        [String[]]$NodeName = 'localhost'
    )

    Import-DscResource -ModuleName xWebAdministration

    Node $NodeName
    {
        xWebAppPool AppPool
        {
            Name                           = 'DummyAppPool'
            Ensure                         = 'Present'
            State                          = 'Started'
            autoStart                      = $true
            idleTimeout                    = (New-TimeSpan -Minutes 20).ToString()  
            restartPrivateMemoryLimit      = 700000
            logEventOnRecycle              = 'Time,Memory,PrivateMemory'
        }
    }
}
