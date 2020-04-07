<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:ms="urn:schemas-microsoft-com:xslt"
                              exclude-result-prefixes="ms">

    <xsl:import href="../../src/InvoiceEntryTemplate.xslt"/>
    <xsl:import href="../framework/UnitTesting.xslt"/>

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <tests>
            <tests_for_text_nodes>
                <test id="Test_InvoiceBodyTypeVariable_ContainsText_ExamplePassCase">
                    <xsl:call-template name="ASSERT_THAT_TEXT">
                        <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$textModes/CONTAINS"/>
                        <xsl:with-param name="text2">perInv</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_ContainsText_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_THAT_TEXT">
                        <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$textModes/CONTAINS"/>
                        <xsl:with-param name="text2">perTestInv</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_EndsWithText_ExamplePassCase">
                    <xsl:call-template name="ASSERT_THAT_TEXT">
                        <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$textModes/ENDS_WITH"/>
                        <xsl:with-param name="text2">voice</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_EndsWithText_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_THAT_TEXT">
                        <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$textModes/ENDS_WITH"/>
                        <xsl:with-param name="text2">voiceTest</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_EqualsText_ExamplePassCase">
                    <xsl:call-template name="ASSERT_THAT_TEXT">
                        <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$textModes/EQUALS"/>
                        <xsl:with-param name="text2">SuperInvoice</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_EqualsText_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_THAT_TEXT">
                        <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$textModes/EQUALS"/>
                        <xsl:with-param name="text2">SuperTest_Invoice</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_StartsWithText_ExamplePassCase">
                    <xsl:call-template name="ASSERT_THAT_TEXT">
                        <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$textModes/STARTS_WITH"/>
                        <xsl:with-param name="text2">Super</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_StartsWithText_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_THAT_TEXT">
                        <xsl:with-param name="text1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$textModes/STARTS_WITH"/>
                        <xsl:with-param name="text2">SuperTest</xsl:with-param>
                    </xsl:call-template>
                </test>
            </tests_for_text_nodes>
            <tests_for_rtf_nodes>
                <test id="Test_InvoiceTableDataVariable_ContainsText_ExamplePassCase">
                    <xsl:variable name="expected_output">
                        <data>
                            <row>
                                <column name="InvoiceType">Normal</column>
                                <column name="InvoiceAmount">$50</column>
                                <column name="InvoiceRecipient">Mama</column>
                            </row>
                            <row>
                                <column name="InvoiceType">Normal</column>
                                <column name="InvoiceAmount">$60</column>
                                <column name="InvoiceRecipient">Tata</column>
                            </row>
                            <row>
                                <column name="InvoiceType">Priority</column>
                                <column name="InvoiceAmount">$70</column>
                                <column name="InvoiceRecipient">Gosc</column>
                            </row>
                            <row>
                                <column name="InvoiceType">Normal</column>
                                <column name="InvoiceAmount">$80</column>
                                <column name="InvoiceRecipient">Admin</column>
                            </row>
                            <row>
                                <column name="InvoiceType">Normal</column>
                                <column name="InvoiceAmount">$90</column>
                                <column name="InvoiceRecipient">Gosia</column>
                            </row>
                        </data>
                    </xsl:variable>
                    <xsl:call-template name="ASSERT_THAT_NODE">
                        <xsl:with-param name="node1" select="ms:node-set($InvoiceTableData)"/>
                        <xsl:with-param name="mode" select="$rtfModes/EQUALS"/>
                        <xsl:with-param name="node2" select="ms:node-set($expected_output)"/>
                    </xsl:call-template>
                </test>
            </tests_for_rtf_nodes>
        </tests>
    </xsl:template>
</xsl:stylesheet>
