function Get-AlgorithmOid([System.Security.Cryptography.X509Certificates.X509Certificate] $Certificate)
{
    $algorithmOid = $Certificate.GetKeyAlgorithm();

    if ($algorithmOid -eq $script:EccAlgorithmOid)
    {
        $algorithmOid = Get-DecodedBinaryOid -Bytes $Certificate.GetKeyAlgorithmParameters()
    }

    return $algorithmOid
}