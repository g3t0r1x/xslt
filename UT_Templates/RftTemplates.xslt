<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:exsl="http://exslt.org/common"
                              exclude-result-prefixes="exsl">

<xsl:template match="CONTAINS" mode="rft_mode">
    <xsl:param name="node1"/>
    <xsl:param name="node2"/>

    <xsl:attribute name="verdict">failed</xsl:attribute>
</xsl:template>

<xsl:template match="EQUALS" mode="rft_mode">
    <xsl:param name="node1"/>
    <xsl:param name="node2"/>

    <xsl:attribute name="verdict">failed</xsl:attribute>
</xsl:template>

<xsl:template match="STARTS_WITH" mode="rft_mode">
    <xsl:param name="node1"/>
    <xsl:param name="node2"/>

    <xsl:attribute name="verdict">failed</xsl:attribute>
</xsl:template>

</xsl:stylesheet>
