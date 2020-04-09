<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:ms="urn:schemas-microsoft-com:xslt"
                              exclude-result-prefixes="ms">

    <xsl:include href="impl/NodeType.xslt"/>
    <xsl:include href="impl/NumberTemplates.xslt"/>
    <xsl:include href="impl/RtfTemplates.xslt"/>
    <xsl:include href="impl/TextTemplates.xslt"/>

    <xsl:variable name="modes" select="document('Modes.xml')/list"/>

    <xsl:template name="ASSERT_EQUALS">
        <xsl:param name="arg1"/>
        <xsl:param name="arg2"/>

        <xsl:call-template name="ASSERT_THAT">
            <xsl:with-param name="arg1" select="$arg1"/>
            <xsl:with-param name="mode" select="$modes/COMMON/EQUALS"/>
            <xsl:with-param name="arg2" select="$arg2"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="ASSERT_NOT_EQUALS">
        <xsl:param name="arg1"/>
        <xsl:param name="arg2"/>

        <xsl:call-template name="ASSERT_THAT">
            <xsl:with-param name="arg1" select="$arg1"/>
            <xsl:with-param name="mode" select="$modes/COMMON/NOT_EQUALS"/>
            <xsl:with-param name="arg2" select="$arg2"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="ASSERT_TRUE">
        <xsl:param name="arg"/>

        <xsl:call-template name="ASSERT_THAT">
            <xsl:with-param name="arg1" select="boolean($arg)"/>
            <xsl:with-param name="mode" select="$modes/COMMON/EQUALS"/>
            <xsl:with-param name="arg2" select="true()"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="ASSERT_FALSE">
        <xsl:param name="arg"/>

        <xsl:call-template name="ASSERT_THAT">
            <xsl:with-param name="arg1" select="boolean($arg)"/>
            <xsl:with-param name="mode" select="$modes/COMMON/EQUALS"/>
            <xsl:with-param name="arg2" select="false()"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="ASSERT_THAT">
        <xsl:param name="arg1"/>
        <xsl:param name="mode" select="$modes/COMMON/DEFAULT"/>
        <xsl:param name="arg2"/>

        <xsl:variable name="argTypes">
            <list>
                <xsl:apply-templates select="ms:node-set($arg1)" mode="get_type"/>
                <xsl:apply-templates select="ms:node-set($arg2)" mode="get_type"/>
            </list>
        </xsl:variable>
        <xsl:variable name="modeType">
            <list>
                <xsl:apply-templates select="ms:node-set($mode)" mode="get_type"/>
            </list>
        </xsl:variable>

        <result>
            <xsl:choose>
                <xsl:when test="not(ms:node-set($modeType)//rtf)">
                    <xsl:attribute name="verdict">failed</xsl:attribute>
                    <error_message>
                        <mode_type_mismatch>
                            <got><xsl:copy-of select="ms:node-set($modeType)/list/*"/></got>
                            <expected><rtf/></expected>
                        </mode_type_mismatch>
                    </error_message>
                </xsl:when>
                <xsl:when test="ms:node-set($argTypes)//unknown or count(ms:node-set($argTypes)//rtf) = 1">
                    <xsl:attribute name="verdict">failed</xsl:attribute>
                    <error_message>
                        <argument_type_mismatch>
                            <arg1><xsl:copy-of select="ms:node-set($argTypes)/list/*[1]"/></arg1>
                            <arg2><xsl:copy-of select="ms:node-set($argTypes)/list/*[2]"/></arg2>
                        </argument_type_mismatch>
                    </error_message>
                </xsl:when>
                <xsl:when test="count(ms:node-set($argTypes)//rtf) = 2">
                    <xsl:apply-templates select="$mode" mode="rtf_mode">
                        <xsl:with-param name="node1" select="$arg1"/>
                        <xsl:with-param name="node2" select="$arg2"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="count(ms:node-set($argTypes)//number) = 2">
                    <xsl:apply-templates select="$mode" mode="number_mode">
                        <xsl:with-param name="num1" select="$arg1"/>
                        <xsl:with-param name="num2" select="$arg2"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="$mode" mode="text_mode">
                        <xsl:with-param name="text1" select="$arg1"/>
                        <xsl:with-param name="text2" select="$arg2"/>
                    </xsl:apply-templates>
                </xsl:otherwise>
            </xsl:choose>
        </result>
    </xsl:template>
</xsl:stylesheet>
