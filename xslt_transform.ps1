param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$False)]
    [System.String]
    $xslt_stylesheet,

    [Parameter(Mandatory=$True, Position=1, ValueFromPipeline=$False)]
    [System.String]
    $xml_input,

    [Parameter(Mandatory=$False, Position=2, ValueFromPipeline=$False)]
    [System.String]
    $xml_output="output.xml"
)

Try
{
    Write-Host "Creating new XSL Transformation object... " -NoNewLine
    $xslt = New-Object System.Xml.Xsl.XslCompiledTransform
    Write-Host "Success" -ForegroundColor Green

    Write-Host "Loading" $xslt_stylesheet "into memory... " -NoNewLine
    $xslt.Load($xslt_stylesheet)
    Write-Host "Success" -ForegroundColor Green

    Write-Host "Applying XSL Transformation on" $xml_input "file... " -NoNewLine
    $xslt.Transform($xml_input, $xml_output)
    Write-Host "Success" -ForegroundColor Green
}
Catch
{
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Write-Host "Error" $ErrorMessage ":" $FailedItem ":" $_.Exception
}

Write-Host "Transformation results stored in" $xml_output
Write-Host
