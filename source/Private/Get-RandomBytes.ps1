
function Get-RandomByte
{
    [CmdletBinding()]
    [OutputType([System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, 1000)]
        $Count
    )

    $rng = $null

    try
    {
        $rng = New-Object System.Security.Cryptography.RNGCryptoServiceProvider
        $bytes = New-Object byte[]($Count)
        $rng.GetBytes($bytes)

        , $bytes
    }
    finally
    {
        if ($rng -is [IDisposable])
        {
            $rng.Dispose()
        }
    }

}
