param (
    [ValidateSet("number", "password", "animal")]
    [string]$Mode = "number",
    [int]$Min = 1,
    [int]$Max = 10,
    [int]$PasswordLength = 10,
    [int]$SpecialCharsCount = 3,
    [int]$DigitCount = 3
)

if ($mode -eq "number") {
    Get-Random -Minimum $Min -Maximum $Max
    return
}

if ($mode -eq "password") {
    $validChars = "qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM".ToCharArray()
    $specialChars = "!§`"%&/(){[]}=".ToCharArray()
    $digits = "1234567890".ToCharArray()
    $LengthWithoutSpecialAndDigits = $PasswordLength - $SpecialCharsCount - $DigitCount
    if ($LengthWithoutSpecialAndDigits -lt 0) {
        Write-Error "Using your configuration I cannot generate a password. Your password length is not long enough for your special chars and digits combined."
        return
    }

    $password = ""

    for ($i = 1; $i -le $LengthWithoutSpecialAndDigits; $i++ ) {
        $password += $validChars | Get-Random -Count 1
    }
    for ($i = 1; $i -le $SpecialCharsCount; $i++ ) {
        $password += $specialChars | Get-Random -Count 1
    }
    for ($i = 1; $i -le $DigitCount; $i++ ) {
        $password += $digits | Get-Random -Count 1
    }

    $password = ($password.ToCharArray() | Sort-Object {Get-Random}) -join ""
    
    Write-Host $password
    return
}

if ($mode -eq "animal") {
    $adjective = @("funny", "smartly", "passivly", "strangly", "angry") | Get-Random
    $verb = @("snatching", "looking", "focused", "running", "sighing", "lumbering") | Get-Random
    $animal = @("elephant", "lion", "amphibian", "wulf", "bug") | Get-Random

    Write-Host "$($adjective)-$($verb)-$($animal)"
}