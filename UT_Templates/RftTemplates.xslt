<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:ms="urn:schemas-microsoft-com:xslt"
                              exclude-result-prefixes="ms">

<xsl:template match="CONTAINS" mode="rft_mode">
    <xsl:param name="node1"/>
    <xsl:param name="node2"/>

    <xsl:attribute name="verdict">failed</xsl:attribute>
</xsl:template>

<xsl:template match="EQUALS" mode="rft_mode">
    <xsl:param name="node1"/>
    <xsl:param name="node2"/>

    <xsl:variable name="result">
        <xsl:call-template name="DIFF">
            <xsl:with-param name="node1" select="$node1"/>
            <xsl:with-param name="node2" select="$node2"/>
        </xsl:call-template>
    </xsl:variable>

    <xsl:choose>
        <xsl:when test="not(ms:node-set($result)//error-message)">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <xsl:copy-of select="ms:node-set($result)//error-message"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="DIFF">
    <xsl:param name="node1"/>
    <xsl:param name="node2"/>


</xsl:template>

</xsl:stylesheet>
