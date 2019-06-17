<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="Invoice.xslt"/>
    <xsl:import href="UnitTesting.xslt"/>

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <tests>
            <test id="TestInvoiceBodyTypeVariable">
                <xsl:call-template name="ASSERT_THAT_TEXT">
                    <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                    <xsl:with-param name="mode" select="$textModes/STARTS_WITH"/>
                    <xsl:with-param name="text2">Super</xsl:with-param>
                </xsl:call-template>
            </test>
        </tests>
    </xsl:template>
</xsl:stylesheet>
