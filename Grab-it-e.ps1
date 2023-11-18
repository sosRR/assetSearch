## First attempt at writing a ps1 Powershell script #
## If i am not configured correctly all help is welcome #


# User Input
$fullName = Read-Host "Enter the person's full name"
$dateOfBirth = Read-Host "Enter the person's date of birth (YYYY-MM-DD)"

# Display the entered information
Write-Host "Full Name: $fullName"
Write-Host "Date of Birth: $dateOfBirth"

# Web Scraping
# Use Invoke-WebRequest to fetch web pages and store them in $webPage variable
# Example: $webPage = Invoke-WebRequest -Uri "https://example.com"
$webPage = Invoke-WebRequest -Uri "https://www.wvtreasury.com/Unclaimed-Property","https://wismissingmoney.com/Home.aspx","http:/treasurer.state.wy.us/upsearch.asp","https://claimittexas.org/app/claim","http:/comptroller.tn.gov/tax-relief/claim-funds.html","https://sdtreasurer.gov/unclaimedproperty/default.aspx","https://treasurer.sc.gov/unclaimed-property/","https://www.unclaimedproperty.ri.gov/","https://www.nccash.com/","https://ouf.osc.state.ny.us/ouf/#home","http:/tax.state.nm.us/unclprop/unclprop.htm","https://unclaimedproperty.njportal.com/","http:/www.nh.unclaimeproperty.com/index.cfm?action=main.unclaimed_property_search","https://nevadatreasurer.gov/UnclaimedProperty/Index.html","https://treasurer.nebraska.gov/up/","https://showmemoney.com/Home/Index","http:/treasury.ms.gov/unclaimed-property/#home","http:/mn.unclaimed.org/index.html","http://www.michigan.gov/treasury/0,4679,7-121-44435_59289---,00.html","https://findmassmoney.com/","https://interactive.marylandtaxes.com/Individuals/unclaim/default.aspx","https://www.maineunclaimedproperty.gov/","https://www.latreasury.com/UnclaimedProperty/MainMenu.aspx","http://treasury.ky.gov/unclaimedproperty/pages/default.aspx","https://kansascash.com/","http:/delaware.findyourunclamiedproperty.com/app/main/index.cfm?FBSource=findingForm#searchFormMobileAnchor","http:/www.ctbiglist.com/search/index.htm?SearchType=Individual&CT=Y","https://colorado.findyourunclaimedproperty.com/app/claim-search","http://sco.ca.gov/upd_msg.html","http://auditor.arizona.edu/unclaimfunds.html","https://treasury.dor.alaska.gov/Home/Unclaimed-Property.aspx","http://auditor.arizona.edu/unclaimfunds.html","https://treasury.dor.alaska.gov/Home/Unclaimed-Property.aspx","https://treasury.alabama.gov/unclaimed-property/"

# Search and Data Extraction
# Use regular expressions or HTML parsing to filter and extract relevant information
# Example: $foundData = $webPage.Content | Select-String -Pattern "pattern_to_match"
$foundData = $webPage.Content | Select-String -Pattern "$fullName","$dateOfBirth"

# Report Generation
# Create a PowerShell object or format data as needed
$reportData = New-Object PSObject -Property @{
    Owner Name = ""
    Debtor Name = ""
    Address = ""
    City = ""
    State = ""
    Phone = ""
    Amount = ""
}

# Save report to a text file
$reportData | Export-Csv -Path "grab-It-e_report.csv" -NoTypeInformation

# Display Results
Write-Host "Report generated and saved as grab-It-e_report.csv"
