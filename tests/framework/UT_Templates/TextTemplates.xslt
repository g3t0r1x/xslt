<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="node()" mode="text_mode">
    <xsl:param name="node1"/>
    <xsl:param name="node2"/>

    <xsl:attribute name="verdict">failed</xsl:attribute>
    <error_message>
        <default_or_not_supported_mode_used>
            <xsl:attribute name="provided_mode"><xsl:value-of select="name(current())"/></xsl:attribute>
        </default_or_not_supported_mode_used>
    </error_message>
</xsl:template>

<xsl:template match="text()" mode="text_mode">
    <xsl:param name="node1"/>
    <xsl:param name="node2"/>

    <xsl:attribute name="verdict">failed</xsl:attribute>
    <error_message>
        <default_or_not_supported_mode_used>
            <xsl:attribute name="provided_mode"><xsl:value-of select="current()"/></xsl:attribute>
        </default_or_not_supported_mode_used>
    </error_message>
</xsl:template>

<xsl:template match="CONTAINS" mode="text_mode">
    <xsl:param name="text1"/>
    <xsl:param name="text2"/>

    <xsl:choose>
        <xsl:when test="contains($text1, $text2)">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <text1><xsl:value-of select="$text1"/></text1>
                <not_contains/>
                <text2><xsl:value-of select="$text2"/></text2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="ENDS_WITH" mode="text_mode">
    <xsl:param name="text1"/>
    <xsl:param name="text2"/>

    <xsl:choose>
        <xsl:when test="$text2 = substring($text1, string-length($text1) - string-length($text2) + 1)">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <text1><xsl:value-of select="$text1"/></text1>
                <does_not_end_with/>
                <text2><xsl:value-of select="$text2"/></text2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="EQUALS" mode="text_mode">
    <xsl:param name="text1"/>
    <xsl:param name="text2"/>

    <xsl:choose>
        <xsl:when test="$text1 = $text2">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <text1><xsl:value-of select="$text1"/></text1>
                <not_equals/>
                <text2><xsl:value-of select="$text2"/></text2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="STARTS_WITH" mode="text_mode">
    <xsl:param name="text1"/>
    <xsl:param name="text2"/>

    <xsl:choose>
        <xsl:when test="starts-with($text1, $text2)">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <text1><xsl:value-of select="$text1"/></text1>
                <does_not_start_with/>
                <text2><xsl:value-of select="$text2"/></text2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>
