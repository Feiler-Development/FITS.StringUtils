@{
    RootModule        = 'FITS.StringUtils.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '2dcb75b2-9d64-48bc-8f47-be6cd965c982'
    Author            = 'Daniel Feiler'
    CompanyName       = 'FITS'
    Copyright         = '(c) Daniel Feiler. All rights reserved.'
    Description       = 'Replace special characters and diacritics in strings using named or custom replacement sets. Covers German, Nordic, Romance, Eastern European, Baltic, Turkish and Asian transliteration characters.'
    PowerShellVersion = '5.1'

    FunctionsToExport = @(
        'Convert-SpecialCharsInString'
        'Get-CharacterSetNames'
    )

    CmdletsToExport   = @()
    AliasesToExport   = @()
    VariablesToExport = @()

    PrivateData = @{
        PSData = @{
            Tags       = @('String', 'Diacritics', 'Encoding', 'Replacement', 'Unicode',
                           'PSEdition_Desktop', 'PSEdition_Core', 'FITS')
            ProjectUri = 'https://github.com/Feiler-Development/FITS.StringUtils'
            LicenseUri = 'https://github.com/Feiler-Development/FITS.StringUtils/blob/main/LICENSE'
            # HelpInfoUri = 'https://help.feilers.dev/modules/FITS.StringUtils/'
            ReleaseNotes = 'Initial release.'
        }
    }
}
