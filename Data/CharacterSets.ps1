# ─────────────────────────────────────────────────────────────────────────────
#  Atomic base sets  ($_ prefix = internal, not exposed as named sets)
#  Composite sets are built by combining base sets with +
# ─────────────────────────────────────────────────────────────────────────────

$_SpecialChars = [string[]]@(
    ' ',            ''      # U+0020  Space
    '-',            ''      # U+002D  Hyphen-Minus
    [char]0x2013,   ''      # U+2013  En-Dash
    [char]0x2014,   ''      # U+2014  Em-Dash
    ',',            ''      # U+002C  Comma
    '.',            ''      # U+002E  Full Stop
    "'",            ''      # U+0027  Apostrophe (straight)
    '"',            ''      # U+0022  Quotation Mark (straight)
    [char]0x2018,   ''      # U+2018  Left Single Quote
    [char]0x2019,   ''      # U+2019  Right Single Quote
    [char]0x201A,   ''      # U+201A  Single Low-9 Quote
    [char]0x201B,   ''      # U+201B  Single High-Rev-9 Quote
    [char]0x201C,   ''      # U+201C  Left Double Quote
    [char]0x201D,   ''      # U+201D  Right Double Quote
    [char]0x201E,   ''      # U+201E  Double Low-9 Quote
    [char]0x201F,   ''      # U+201F  Double High-Rev-9 Quote
    [char]0x2032,   ''      # U+2032  Prime
    [char]0x2033,   ''      # U+2033  Double Prime
    [char]0x2034,   ''      # U+2034  Triple Prime
    [char]0x2035,   ''      # U+2035  Reversed Prime
    [char]0x2036,   ''      # U+2036  Reversed Double Prime
    [char]0x2037,   ''      # U+2037  Reversed Triple Prime
    [char]0x2039,   ''      # U+2039  Single Left Angle Quote
    [char]0x203A,   ''      # U+203A  Single Right Angle Quote
    [char]0x00AB,   ''      # U+00AB  Left Double Angle Quote
    [char]0x00BB,   ''      # U+00BB  Right Double Angle Quote
    '/',            ''      # U+002F  Solidus
    '\',            ''      # U+005C  Reverse Solidus
    '&',            ''      # U+0026  Ampersand
    '`',            ''      # U+0060  Grave Accent
    '(',            ''      # U+0028  Left Parenthesis
    ')',            ''      # U+0029  Right Parenthesis
    '+',            ''      # U+002B  Plus Sign
    '#',            ''      # U+0023  Number Sign
    '@',            ''      # U+0040  Commercial At
    '|',            ''      # U+007C  Vertical Line
    '^',            ''      # U+005E  Circumflex Accent
    '%',            ''      # U+0025  Percent Sign
    '!',            ''      # U+0021  Exclamation Mark
    [char]0x00B7,   ''      # U+00B7  Middle Dot
)

$_EmailSpecialChars = [string[]]@(
    ' ',            ''
    [char]0x2013,   '-'
    [char]0x2014,   '-'
    ',',            ''
    "'",            ''
    '"',            ''
    [char]0x2018,   ''
    [char]0x2019,   ''
    [char]0x201C,   ''
    [char]0x201D,   ''
    '/',            '-'
    '\',            ''
    '&',            'and'
    '`',            ''
    '(',            ''
    ')',            ''
    '#',            ''
    '@',            ''
    '|',            ''
    '^',            ''
    '%',            ''
    '!',            ''
    [char]0x00B7,   '.'
)

$_GermanChars = [string[]]@(
    [char]0x00E4,   'ae'    # ae
    [char]0x00C4,   'Ae'    # AE
    [char]0x00F6,   'oe'    # oe
    [char]0x00D6,   'Oe'    # OE
    [char]0x00FC,   'ue'    # ue
    [char]0x00DC,   'Ue'    # UE
    [char]0x00DF,   'ss'    # ss
)

$_NordicChars = [string[]]@(
    [char]0x00E5,   'a'     # a ring
    [char]0x00C5,   'A'
    [char]0x00E6,   'ae'    # ae ligature
    [char]0x00C6,   'Ae'
    [char]0x00F8,   'oe'    # o stroke
    [char]0x00D8,   'Oe'
    [char]0x00F0,   'd'     # Icelandic eth
    [char]0x00D0,   'D'
    [char]0x00FE,   'th'    # Icelandic thorn
    [char]0x00DE,   'Th'
)

$_RomanceChars = [string[]]@(
    [char]0x00E0,   'a'     # a grave
    [char]0x00C0,   'A'
    [char]0x00E2,   'a'     # a circumflex
    [char]0x00C2,   'A'
    [char]0x00E1,   'a'     # a acute
    [char]0x00C1,   'A'
    [char]0x00E3,   'a'     # a tilde
    [char]0x00C3,   'A'
    [char]0x00E7,   'c'     # c cedilla
    [char]0x00C7,   'C'
    [char]0x00E8,   'e'     # e grave
    [char]0x00C8,   'E'
    [char]0x00E9,   'e'     # e acute
    [char]0x00C9,   'E'
    [char]0x00EA,   'e'     # e circumflex
    [char]0x00CA,   'E'
    [char]0x00EB,   'e'     # e diaeresis
    [char]0x00CB,   'E'
    [char]0x00EE,   'i'     # i circumflex
    [char]0x00CE,   'I'
    [char]0x00EF,   'i'     # i diaeresis
    [char]0x00CF,   'I'
    [char]0x00ED,   'i'     # i acute
    [char]0x00CD,   'I'
    [char]0x00F1,   'n'     # n tilde
    [char]0x00D1,   'N'
    [char]0x00F4,   'o'     # o circumflex
    [char]0x00D4,   'O'
    [char]0x00F3,   'o'     # o acute
    [char]0x00D3,   'O'
    [char]0x00F2,   'o'     # o grave
    [char]0x00D2,   'O'
    [char]0x00F5,   'o'     # o tilde
    [char]0x00D5,   'O'
    [char]0x0153,   'oe'    # oe ligature
    [char]0x0152,   'Oe'
    [char]0x00FA,   'u'     # u acute
    [char]0x00DA,   'U'
    [char]0x00F9,   'u'     # u grave
    [char]0x00D9,   'U'
    [char]0x00FB,   'u'     # u circumflex
    [char]0x00DB,   'U'
    [char]0x00FD,   'y'     # y acute
    [char]0x00DD,   'Y'
    [char]0x00FF,   'y'     # y diaeresis
)

$_EasternEuChars = [string[]]@(
    [char]0x0105,   'a'     [char]0x0104,   'A'     # a/A ogonek (Polish)
    [char]0x0119,   'e'     [char]0x0118,   'E'     # e/E ogonek
    [char]0x0142,   'l'     [char]0x0141,   'L'     # l/L stroke
    [char]0x0144,   'n'     [char]0x0143,   'N'     # n/N acute
    [char]0x015B,   's'     [char]0x015A,   'S'     # s/S acute
    [char]0x017A,   'z'     [char]0x0179,   'Z'     # z/Z acute
    [char]0x017C,   'z'     [char]0x017B,   'Z'     # z/Z dot above
    [char]0x010D,   'c'     [char]0x010C,   'C'     # c/C caron (Czech/Slovak)
    [char]0x0107,   'c'     [char]0x0106,   'C'     # c/C acute
    [char]0x010F,   'd'     [char]0x010E,   'D'     # d/D caron
    [char]0x011B,   'e'     [char]0x011A,   'E'     # e/E caron
    [char]0x013E,   'l'     [char]0x013D,   'L'     # l/L caron
    [char]0x013A,   'l'     [char]0x0139,   'L'     # l/L acute
    [char]0x0148,   'n'     [char]0x0147,   'N'     # n/N caron
    [char]0x0159,   'r'     [char]0x0158,   'R'     # r/R caron
    [char]0x0155,   'r'     [char]0x0154,   'R'     # r/R acute
    [char]0x0161,   's'     [char]0x0160,   'S'     # s/S caron
    [char]0x0165,   't'     [char]0x0164,   'T'     # t/T caron
    [char]0x016F,   'u'     [char]0x016E,   'U'     # u/U ring above
    [char]0x017E,   'z'     [char]0x017D,   'Z'     # z/Z caron
    [char]0x0151,   'oe'    [char]0x0150,   'Oe'    # o/O double acute (Hungarian)
    [char]0x0171,   'ue'    [char]0x0170,   'Ue'    # u/U double acute
)

$_BalticChars = [string[]]@(
    [char]0x0101,   'a'     [char]0x0100,   'A'     # a/A macron
    [char]0x0113,   'e'     [char]0x0112,   'E'     # e/E macron
    [char]0x0117,   'e'     [char]0x0116,   'E'     # e/E dot (Lithuanian)
    [char]0x0123,   'g'     [char]0x0122,   'G'     # g/G cedilla (Latvian)
    [char]0x012B,   'i'     [char]0x012A,   'I'     # i/I macron
    [char]0x012F,   'i'     [char]0x012E,   'I'     # i/I ogonek (Lithuanian)
    [char]0x0137,   'k'     [char]0x0136,   'K'     # k/K cedilla (Latvian)
    [char]0x013C,   'l'     [char]0x013B,   'L'     # l/L cedilla
    [char]0x0146,   'n'     [char]0x0145,   'N'     # n/N cedilla
    [char]0x0157,   'r'     [char]0x0156,   'R'     # r/R cedilla
    [char]0x016B,   'u'     [char]0x016A,   'U'     # u/U macron
    [char]0x0173,   'u'     [char]0x0172,   'U'     # u/U ogonek (Lithuanian)
)

$_TurkishChars = [string[]]@(
    [char]0x011F,   'g'     [char]0x011E,   'G'     # g/G breve
    [char]0x0131,   'i'                             # dotless i
    [char]0x0130,   'I'                             # I with dot above
    [char]0x015F,   's'     [char]0x015E,   'S'     # s/S cedilla
)

$_ArabicTrans = [string[]]@(
    [char]0x02BF,   ''      # Ayn
    [char]0x02BE,   ''      # Hamza
)

$_AsianChars = [string[]]@(
    [char]0x01CE,   'a'     # a caron  (Pinyin 3rd tone)
    [char]0x01D0,   'i'     # i caron
    [char]0x01D2,   'o'     # o caron
    [char]0x01D4,   'u'     # u caron
    [char]0x01D6,   'ue'    # u diaeresis + macron (1st tone)
    [char]0x01D8,   'ue'    # u diaeresis + acute  (2nd tone)
    [char]0x01DA,   'ue'    # u diaeresis + caron  (3rd tone)
    [char]0x01DC,   'ue'    # u diaeresis + grave  (4th tone)
)

# ─────────────────────────────────────────────────────────────────────────────
#  Composite sets — these are what the module exposes via Get-CharacterSetNames
# ─────────────────────────────────────────────────────────────────────────────
@{
    Default = $_SpecialChars   +
              $_GermanChars    +
              $_NordicChars    +
              $_RomanceChars   +
              $_EasternEuChars +
              $_BalticChars    +
              $_TurkishChars   +
              $_AsianChars     +
              $_ArabicTrans

    Email   = $_EmailSpecialChars +
              $_GermanChars       +
              $_NordicChars       +
              $_RomanceChars      +
              $_EasternEuChars    +
              $_TurkishChars

    DACH    = $_SpecialChars +
              $_GermanChars  +
              $_NordicChars
}
