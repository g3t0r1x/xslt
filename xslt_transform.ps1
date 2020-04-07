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

    Write-Host "Enabling mandatory XSL settings ... " -NoNewLine
    $xslt_settings = New-Object System.Xml.Xsl.XsltSettings
    $xslt_settings.EnableScript = 1
    $xslt_settings.EnableDocumentFunction = 1
    Write-Host "Success" -ForegroundColor Green

    Write-Host "Creating new XML URL resolver object... " -NoNewLine
    $xml_url_resolver = New-Object System.Xml.XmlUrlResolver;
    Write-Host "Success" -ForegroundColor Green

    Write-Host "Loading" $xslt_stylesheet "into memory... " -NoNewLine
    $xslt.Load($xslt_stylesheet, $xslt_settings, $xml_url_resolver)
    Write-Host "Success" -ForegroundColor Green
}
Catch
{
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Write-Host "Error" $ErrorMessage ":" $FailedItem ":" $_.Exception
}

Try
{
    Write-Host "Enabling XML pretty printing settings ... " -NoNewLine
    $xml_writter_settings = New-Object System.Xml.XmlWriterSettings
    $xml_writter_settings.Indent = 1
    $xml_writter_settings.IndentChars = "    "
    Write-Host "Success" -ForegroundColor Green

    Write-Host "Creating new XML writer object... " -NoNewLine
    $xml_writer = [System.Xml.XmlWriter]::Create($xml_output, $xml_writter_settings)
    Write-Host "Success" -ForegroundColor Green
}
Catch
{
    $xml_writer.Close()
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Write-Host "Error" $ErrorMessage ":" $FailedItem ":" $_.Exception
}

Try
{
    Write-Host "Creating new XML reader object... " -NoNewLine
    $xml_reader = [System.Xml.XmlReader]::Create($xml_input)
    Write-Host "Success" -ForegroundColor Green
}
Catch
{
    $xml_reader.Close()
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Write-Host "Error" $ErrorMessage ":" $FailedItem ":" $_.Exception
}

Try
{
    Write-Host "Applying XSL Transformation on" $xml_input "file... " -NoNewLine
    $xslt.Transform($xml_reader, $xml_writer)
    Write-Host "Success" -ForegroundColor Green
}
Catch
{
    $xml_writer.Close()
    $xml_reader.Close()
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Write-Host "Error" $ErrorMessage ":" $FailedItem ":" $_.Exception
}

Write-Host "Releasing alocated memory... " -NoNewLine
$xml_writer.Close()
$xml_reader.Close()
Write-Host "Success" -ForegroundColor Green

Write-Host "Transformation results stored in" $xml_output
Write-Host
