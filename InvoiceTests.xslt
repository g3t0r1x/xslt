<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="Invoice.xslt"/>
    <xsl:import href="UnitTesting.xslt"/>

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <tests>
            <test id="TestInvoiceBodyTypeVariableContains_PASS">
                <xsl:call-template name="ASSERT_THAT_TEXT">
                    <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                    <xsl:with-param name="mode" select="$textModes/CONTAINS"/>
                    <xsl:with-param name="text2">perInv</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="TestInvoiceBodyTypeVariableContains_FAILED">
                <xsl:call-template name="ASSERT_THAT_TEXT">
                    <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                    <xsl:with-param name="mode" select="$textModes/CONTAINS"/>
                    <xsl:with-param name="text2">perTestInv</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="TestInvoiceBodyTypeVariableEndsWith_PASS">
                <xsl:call-template name="ASSERT_THAT_TEXT">
                    <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                    <xsl:with-param name="mode" select="$textModes/ENDS_WITH"/>
                    <xsl:with-param name="text2">voice</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="TestInvoiceBodyTypeVariableEndsWith_FAILED">
                <xsl:call-template name="ASSERT_THAT_TEXT">
                    <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                    <xsl:with-param name="mode" select="$textModes/ENDS_WITH"/>
                    <xsl:with-param name="text2">voiceTest</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="TestInvoiceBodyTypeVariableEquals_PASS">
                <xsl:call-template name="ASSERT_THAT_TEXT">
                    <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                    <xsl:with-param name="mode" select="$textModes/EQUALS"/>
                    <xsl:with-param name="text2">SuperInvoice</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="TestInvoiceBodyTypeVariableEquals_FAILED">
                <xsl:call-template name="ASSERT_THAT_TEXT">
                    <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                    <xsl:with-param name="mode" select="$textModes/EQUALS"/>
                    <xsl:with-param name="text2">SuperTestInvoice</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="TestInvoiceBodyTypeVariableStartsWith_PASS">
                <xsl:call-template name="ASSERT_THAT_TEXT">
                    <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                    <xsl:with-param name="mode" select="$textModes/STARTS_WITH"/>
                    <xsl:with-param name="text2">Super</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="TestInvoiceBodyTypeVariableStartsWith_FAILED">
                <xsl:call-template name="ASSERT_THAT_TEXT">
                    <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                    <xsl:with-param name="mode" select="$textModes/STARTS_WITH"/>
                    <xsl:with-param name="text2">SuperTest</xsl:with-param>
                </xsl:call-template>
            </test>
        </tests>
    </xsl:template>
</xsl:stylesheet>
