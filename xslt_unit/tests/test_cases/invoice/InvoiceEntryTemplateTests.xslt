<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:ms="urn:schemas-microsoft-com:xslt"
                              exclude-result-prefixes="ms">

    <xsl:import href="../../../src/InvoiceEntryTemplate.xslt"/>
    <xsl:import href="../../framework/UnitTestingFacade.xslt"/>

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <tests>
            <tests_for_numbers>
                <xsl:variable name="AfterTransform">
                    <xsl:apply-imports/>
                </xsl:variable>
                <xsl:variable name="AfterTransformRTF" select="ms:node-set($AfterTransform)/*"/>

                <test id="Test_TransactionTable_NumberOfColumns_ExamplePassCase">
                    <xsl:call-template name="ASSERT_EQUALS">
                        <xsl:with-param name="arg1" select="count($AfterTransformRTF//table[@id='transaction_table']//tr/th)"/>
                        <xsl:with-param name="arg2">3</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_TransactionTable_NumberOfColumns_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_EQUALS">
                        <xsl:with-param name="arg1" select="count($AfterTransformRTF//table[@id='transaction_table']//tr/th)"/>
                        <xsl:with-param name="arg2">10</xsl:with-param>
                    </xsl:call-template>
                </test>
            </tests_for_numbers>
            <tests_for_text_nodes>
                <test id="Test_InvoiceBodyTypeVariable_ContainsText_ExamplePassCase">
                    <xsl:call-template name="ASSERT_THAT">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$modes/TEXT_SPECIFIC/CONTAINS"/>
                        <xsl:with-param name="arg2">perInv</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_ContainsText_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_THAT">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$modes/TEXT_SPECIFIC/CONTAINS"/>
                        <xsl:with-param name="arg2">perTestInv</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_EndsWithText_ExamplePassCase">
                    <xsl:call-template name="ASSERT_THAT">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$modes/TEXT_SPECIFIC/ENDS_WITH"/>
                        <xsl:with-param name="arg2">voice</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_EndsWithText_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_THAT">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$modes/TEXT_SPECIFIC/ENDS_WITH"/>
                        <xsl:with-param name="arg2">voiceTest</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_EqualsText_ExamplePassCase">
                    <xsl:call-template name="ASSERT_EQUALS">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="arg2">SuperInvoice</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_EqualsText_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_EQUALS">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="arg2">SuperTest_Invoice</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_NotEqualsText_ExamplePassCase">
                    <xsl:call-template name="ASSERT_NOT_EQUALS">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="arg2">SuperTest_Invoice</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_NotEqualsText_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_NOT_EQUALS">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="arg2">SuperInvoice</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_StartsWithText_ExamplePassCase">
                    <xsl:call-template name="ASSERT_THAT">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$modes/TEXT_SPECIFIC/STARTS_WITH"/>
                        <xsl:with-param name="arg2">Super</xsl:with-param>
                    </xsl:call-template>
                </test>
                <test id="Test_InvoiceBodyTypeVariable_StartsWithText_ExampleFailedCase">
                    <xsl:call-template name="ASSERT_THAT">
                        <xsl:with-param name="arg1" select="$InvoiceBodyType"/>
                        <xsl:with-param name="mode" select="$modes/TEXT_SPECIFIC/STARTS_WITH"/>
                        <xsl:with-param name="arg2">SuperTest</xsl:with-param>
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
                    <xsl:call-template name="ASSERT_EQUALS">
                        <xsl:with-param name="arg1" select="ms:node-set($InvoiceTableData)"/>
                        <xsl:with-param name="arg2" select="ms:node-set($expected_output)"/>
                    </xsl:call-template>
                </test>
            </tests_for_rtf_nodes>
        </tests>
    </xsl:template>
</xsl:stylesheet>
