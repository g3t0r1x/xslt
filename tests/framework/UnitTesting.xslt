<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:ms="urn:schemas-microsoft-com:xslt"
                              exclude-result-prefixes="ms">

<xsl:include href="UT_Templates/TextTemplates.xslt"/>
<xsl:include href="UT_Templates/RtfTemplates.xslt"/>

<xsl:variable name="textModes" select="document('UT_Templates/TextModes.xml')/list"/>
<xsl:variable name="rtfModes" select="document('UT_Templates/RtfModes.xml')/list"/>

<xsl:template name="ASSERT_THAT_TEXT">
    <xsl:param name="text1"/>
    <xsl:param name="mode"/>
    <xsl:param name="text2"/>

    <result>
        <xsl:apply-templates select="$mode" mode="text_mode">
            <xsl:with-param name="text1" select="$text1"/>
            <xsl:with-param name="text2" select="$text2"/>
        </xsl:apply-templates>
    </result>
</xsl:template>

<xsl:template name="ASSERT_THAT_NODE">
    <xsl:param name="node1"/>
    <xsl:param name="mode"/>
    <xsl:param name="node2"/>

    <result>
        <xsl:apply-templates select="$mode" mode="rtf_mode">
            <xsl:with-param name="node1" select="$node1"/>
            <xsl:with-param name="node2" select="$node2"/>
        </xsl:apply-templates>
    </result>
</xsl:template>

</xsl:stylesheet>
