<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:ms="urn:schemas-microsoft-com:xslt"
                              exclude-result-prefixes="ms">

    <xsl:import href="../../framework/UnitTestingFacade.xslt"/>

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <tests>
            <test id="Test_AsertEqualsTemplate_ExamplePassCase">
                <xsl:call-template name="ASSERT_EQUALS">
                    <xsl:with-param name="arg1">1</xsl:with-param>
                    <xsl:with-param name="arg2">1</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_AsertEqualsTemplate_ExampleFailedCase">
                <xsl:call-template name="ASSERT_EQUALS">
                    <xsl:with-param name="arg1">SomeRandomText</xsl:with-param>
                    <xsl:with-param name="arg2">SomeRandomText2</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_AsertNotEqualsTemplate_ExamplePassCase">
                <xsl:call-template name="ASSERT_NOT_EQUALS">
                    <xsl:with-param name="arg1">SomeRandomText</xsl:with-param>
                    <xsl:with-param name="arg2">SomeRandomText2</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_AsertNotEqualsTemplate_ExampleFailedCase">
                <xsl:call-template name="ASSERT_NOT_EQUALS">
                    <xsl:with-param name="arg1">1</xsl:with-param>
                    <xsl:with-param name="arg2">1</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_AsertTrueTemplate_ExamplePassCase">
                <xsl:call-template name="ASSERT_TRUE">
                    <xsl:with-param name="arg" select="true()"/>
                </xsl:call-template>
            </test>
            <test id="Test_AsertTrueTemplate_ExampleFailedCase">
                <xsl:call-template name="ASSERT_TRUE">
                    <xsl:with-param name="arg" select="false()"/>
                </xsl:call-template>
            </test>
            <test id="Test_AsertFalseTemplate_ExamplePassCase">
                <xsl:call-template name="ASSERT_FALSE">
                    <xsl:with-param name="arg" select="false()"/>
                </xsl:call-template>
            </test>
            <test id="Test_AsertFalseTemplate_ExampleFailedCase">
                <xsl:call-template name="ASSERT_FALSE">
                    <xsl:with-param name="arg" select="true()"/>
                </xsl:call-template>
            </test>
            <test id="Test_ModeTypeMismatch">
                <xsl:call-template name="ASSERT_THAT">
                    <xsl:with-param name="arg1">SomeRandomText</xsl:with-param>
                    <xsl:with-param name="mode" select="true()"/>
                    <xsl:with-param name="arg2">SomeRandomText2</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_ArgumentTypeMismatch">
                <xsl:variable name="node"><my_node/></xsl:variable>
                <xsl:call-template name="ASSERT_THAT">
                    <xsl:with-param name="arg1" select="ms:node-set($node)"/>
                    <xsl:with-param name="mode" select="$modes/COMMON/DEFAULT"/>
                    <xsl:with-param name="arg2">SomeRandomText</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_DefaultModeForNumbers">
                <xsl:call-template name="ASSERT_THAT">
                    <xsl:with-param name="arg1">1</xsl:with-param>
                    <xsl:with-param name="mode" select="$modes/COMMON/DEFAULT"/>
                    <xsl:with-param name="arg2">2</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_NotSupportedModeForNumbers">
                <xsl:variable name="node"><my_node/></xsl:variable>
                <xsl:call-template name="ASSERT_THAT">
                    <xsl:with-param name="arg1">1</xsl:with-param>
                    <xsl:with-param name="mode" select="ms:node-set($node)"/>
                    <xsl:with-param name="arg2">2</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_DefaultModeForRtf">
                <xsl:variable name="node"><my_node/></xsl:variable>
                <xsl:call-template name="ASSERT_THAT">
                    <xsl:with-param name="arg1" select="ms:node-set($node)"/>
                    <xsl:with-param name="mode" select="$modes/COMMON/DEFAULT"/>
                    <xsl:with-param name="arg2" select="ms:node-set($node)"/>
                </xsl:call-template>
            </test>
            <test id="Test_NotSupportedModeForRtf">
                <xsl:variable name="node"><my_node/></xsl:variable>
                <xsl:call-template name="ASSERT_THAT">
                    <xsl:with-param name="arg1" select="ms:node-set($node)"/>
                    <xsl:with-param name="mode" select="ms:node-set($node)"/>
                    <xsl:with-param name="arg2" select="ms:node-set($node)"/>
                </xsl:call-template>
            </test>
            <test id="Test_DefaultModeForText">
                <xsl:call-template name="ASSERT_THAT">
                    <xsl:with-param name="arg1">SomeRandomText</xsl:with-param>
                    <xsl:with-param name="mode" select="$modes/COMMON/DEFAULT"/>
                    <xsl:with-param name="arg2">SomeRandomText2</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_NotSupportedModeForText">
                <xsl:variable name="node"><my_node/></xsl:variable>
                <xsl:call-template name="ASSERT_THAT">
                    <xsl:with-param name="arg1">SomeRandomText</xsl:with-param>
                    <xsl:with-param name="mode" select="ms:node-set($node)"/>
                    <xsl:with-param name="arg2">SomeRandomText2</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_AfterTransformTypeMismatch">
                <xsl:call-template name="EXPECT_CALL">
                    <xsl:with-param name="afterTransform">SomeRandomText</xsl:with-param>
                    <xsl:with-param name="templateName">SomeRandomText2</xsl:with-param>
                </xsl:call-template>
            </test>
            <test id="Test_TemplateNameTypeMismatch">
                <xsl:variable name="node"><my_node/></xsl:variable>
                <xsl:call-template name="EXPECT_CALL">
                    <xsl:with-param name="afterTransform" select="ms:node-set($node)"/>
                    <xsl:with-param name="templateName" select="ms:node-set($node)"/>
                </xsl:call-template>
            </test>
        </tests>
    </xsl:template>
</xsl:stylesheet>
