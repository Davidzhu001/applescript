--UI of the application
global ButtonReturn
try
	set checkPrinter to "Printing History"
	set otherAction to "Show All Printers"
	
	display alert "Publish4All" message "What do you want to check!" buttons {otherAction, checkPrinter}
	
	set ButtonReturn to button returned of the result
	
	if (ButtonReturn is equal to checkPrinter) then
		do shell script "cupsctl WebInterface=yes"
		tell application "Safari"
			activate
			open location "http://localhost:631/jobs?which_jobs=all"
		end tell
	end if
	
	if (ButtonReturn is equal to otherAction) then
		display alert "Printer Names:" message "Printer Count: " & (count of printNameAarry) buttons printNameAarry
	end if
	
	
end try

--save the data to a file
global returnLineValue
global printingList
global serialNumber
set serialNumber to do shell script "system_profiler SPHardwareDataType | awk '/Serial/ {print $4}'"
set returnLineValue to {}

set printingList to every paragraph of the (do shell script "lpstat -W completed")

set printingItem to every item of printingList as string
do shell script "touch ~/desktop/" & serialNumber & ".txt"
repeat with theCurrentValue in printingList
	set returnLineValue to theCurrentValue & tab & serialNumber & tab
	do shell script "echo " & returnLineValue & " >> ~/desktop/" & serialNumber & ".txt"
end repeat


--delete duplicated lines of the file
set filePath to (path to desktop as text) & serialNumber & ".txt"
set theText to read file filePath
set textList to paragraphs of theText

set uniqueList to {}
repeat with i from 1 to count of textList
	set thisParagraph to item i of textList
	if thisParagraph is not in uniqueList then set end of uniqueList to thisParagraph
end repeat

set {tids, text item delimiters} to {text item delimiters, return}
set uniqueText to uniqueList as text
set text item delimiters to tids

set openFile to open for access file filePath with write permission
set eof of openFile to 0
write uniqueText to openFile starting at eof as text
close access openFile


-- set all the printersName
set printNameLoop to every paragraph of the (do shell script "lpstat -a")
set printNameAarry to {}
repeat with theItem in printNameLoop
	set printerSingleName to first word of theItem
	set end of printNameAarry to printerSingleName
end repeat