# Load localized strings — automatic fallback to en-US if culture file is missing
Import-LocalizedData -BindingVariable script:Strings -FileName FITS.StringUtils -ErrorAction SilentlyContinue
if (-not $script:Strings) {
    Import-LocalizedData -BindingVariable script:Strings -FileName FITS.StringUtils `
                         -UICulture 'en-US' -ErrorAction SilentlyContinue
}

# Load character sets data file once at module import
$script:CharacterSets = & ([scriptblock]::Create(
    (Get-Content -LiteralPath "$PSScriptRoot\Data\CharacterSets.ps1" -Encoding UTF8 -Raw)
))

$MyInvocation.MyCommand.ScriptBlock.Module.OnRemove = {
    Write-Verbose $script:Strings.ModuleRemoved
    Remove-Variable -Name CharacterSets -Scope Script -ErrorAction SilentlyContinue
    Remove-Variable -Name Strings       -Scope Script -ErrorAction SilentlyContinue
}

# ─────────────────────────────────────────────────────────────────────────────
#  Get-CharacterSetNames
# ─────────────────────────────────────────────────────────────────────────────
function Get-CharacterSetNames {
    <#
    .ExternalHelp FITS.StringUtils-Help.xml
    #>
    [CmdletBinding()]
    [OutputType([string[]])]
    param()
    $script:CharacterSets.Keys | Sort-Object
}

# ─────────────────────────────────────────────────────────────────────────────
#  Convert-SpecialCharsInString
# ─────────────────────────────────────────────────────────────────────────────
function Convert-SpecialCharsInString {
    <#
    .ExternalHelp FITS.StringUtils-Help.xml
    #>
    [CmdletBinding(DefaultParameterSetName = 'NamedSet')]
    [OutputType([string])]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $InputString,

        # Name of a character set loaded from the module data file.
        # Use Get-CharacterSetNames to list all available sets.
        [Parameter(ParameterSetName = 'NamedSet', Position = 1)]
        [ValidateScript({
            if ($script:CharacterSets.ContainsKey($_)) { return $true }
            throw ($script:Strings.CharSetNotFound -f $_, ($script:CharacterSets.Keys -join ', '))
        })]
        [string] $CharacterSet = 'Default',

        # Custom replacement array as alternating source/target pairs.
        # Must contain an even number of elements. Overrides -CharacterSet.
        [Parameter(ParameterSetName = 'CustomPairs', Position = 1)]
        [ValidateScript({
            if ($_.Count % 2 -eq 0) { return $true }
            throw $script:Strings.InvalidPairCount
        })]
        [string[]] $ReplacerPairs
    )

    begin {
        # Determine active pair array once per pipeline call
        $activePairs = if ($PSCmdlet.ParameterSetName -eq 'CustomPairs') {
            $ReplacerPairs
        } else {
            $script:CharacterSets[$CharacterSet]
        }

        # Build replacement hashtable and compile regex pattern once for the entire pipeline
        $table = @{}
        for ($i = 0; $i -lt $activePairs.Count; $i += 2) {
            $table[$activePairs[$i]] = $activePairs[$i + 1]
            Write-Verbose ($script:Strings.VerbosePair -f $activePairs[$i], $activePairs[$i + 1])
        }

        $escaped = [regex]::Escape(-join $table.Keys)
        $pattern = [regex]("[$($escaped -replace '-', '\-')]")
        Write-Verbose ($script:Strings.VerbosePattern -f $pattern)
    }

    process {
        [regex]::Replace($InputString, $pattern, { $table[$args[0].Value] })
    }
}
