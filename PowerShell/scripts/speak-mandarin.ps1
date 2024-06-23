﻿<#
.SYNOPSIS
	Speaks text in Mandarin 
.DESCRIPTION
	This PowerShell script speaks the given text with a Mandarin text-to-speech (TTS) voice.
.PARAMETER text
	Specifies the Mandarin text to speak
.EXAMPLE
	PS> ./speak-mandarin.ps1 "你好"
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

param([string]$text = "")

try {
	if ($text -eq "") { $text = Read-Host "Enter the Mandarin text to speak" }

	$TTS = New-Object -ComObject SAPI.SPVoice
	foreach ($voice in $TTS.GetVoices()) {
		if ($voice.GetDescription() -like "*- Mandarin*") { 
			$TTS.Voice = $voice
			[void]$TTS.Speak($text)
			exit 0 # success
		}
	}
	throw "No Mandarin text-to-speech voice found - please install one"
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
