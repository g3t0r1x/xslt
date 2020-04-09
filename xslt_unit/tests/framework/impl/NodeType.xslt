<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="node()" mode="get_type">
        <xsl:choose>
            <xsl:when test="self::*"><rtf/></xsl:when>
            <xsl:when test="self::text()">
                <xsl:choose>
                    <xsl:when test="string(number(current())) = 'NaN'"><text/></xsl:when>
                    <xsl:otherwise><number/></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise><unknown/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
