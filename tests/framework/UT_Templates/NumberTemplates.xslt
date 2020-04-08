<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:ms="urn:schemas-microsoft-com:xslt"
                              exclude-result-prefixes="ms">

<xsl:template match="node()" mode="number_mode">
    <xsl:param name="num1"/>
    <xsl:param name="num2"/>

    <xsl:attribute name="verdict">failed</xsl:attribute>
    <error_message>
        <default_or_not_supported_mode_used>
            <xsl:attribute name="provided_mode"><xsl:value-of select="name(current())"/></xsl:attribute>
        </default_or_not_supported_mode_used>
    </error_message>
</xsl:template>

<xsl:template match="LESS_THAN" mode="number_mode">
    <xsl:param name="num1"/>
    <xsl:param name="num2"/>

    <xsl:variable name="areNumbersValid">
        <result>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num1"/>
            </xsl:call-template>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num2"/>
            </xsl:call-template>
        </result>
    </xsl:variable>

    <xsl:choose>
        <xsl:when test="ms:node-set($areNumbersValid)//invalid_number">
            <xsl:call-template name="InvalidNumbersErrorMessage">
                <xsl:with-param name="num1" select="$num1"/>
                <xsl:with-param name="num2" select="$num2"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:when test="$num1 &lt; $num2">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <num1><xsl:value-of select="$num1"/></num1>
                <not_less_than/>
                <num2><xsl:value-of select="$num2"/></num2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="LESS_THAN_OR_EQUALS" mode="number_mode">
    <xsl:param name="num1"/>
    <xsl:param name="num2"/>

    <xsl:variable name="areNumbersValid">
        <result>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num1"/>
            </xsl:call-template>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num2"/>
            </xsl:call-template>
        </result>
    </xsl:variable>

    <xsl:choose>
        <xsl:when test="ms:node-set($areNumbersValid)//invalid_number">
            <xsl:call-template name="InvalidNumbersErrorMessage">
                <xsl:with-param name="num1" select="$num1"/>
                <xsl:with-param name="num2" select="$num2"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:when test="$num1 &lt;= $num2">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <num1><xsl:value-of select="$num1"/></num1>
                <not_less_than_or_equals/>
                <num2><xsl:value-of select="$num2"/></num2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="GREATER_THAN" mode="number_mode">
    <xsl:param name="num1"/>
    <xsl:param name="num2"/>

    <xsl:variable name="areNumbersValid">
        <result>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num1"/>
            </xsl:call-template>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num2"/>
            </xsl:call-template>
        </result>
    </xsl:variable>

    <xsl:choose>
        <xsl:when test="ms:node-set($areNumbersValid)//invalid_number">
            <xsl:call-template name="InvalidNumbersErrorMessage">
                <xsl:with-param name="num1" select="$num1"/>
                <xsl:with-param name="num2" select="$num2"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:when test="$num1 &gt; $num2">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <num1><xsl:value-of select="$num1"/></num1>
                <not_greater_than/>
                <num2><xsl:value-of select="$num2"/></num2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="GREATER_THAN_OR_EQUALS" mode="number_mode">
    <xsl:param name="num1"/>
    <xsl:param name="num2"/>

    <xsl:variable name="areNumbersValid">
        <result>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num1"/>
            </xsl:call-template>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num2"/>
            </xsl:call-template>
        </result>
    </xsl:variable>

    <xsl:choose>
        <xsl:when test="ms:node-set($areNumbersValid)//invalid_number">
            <xsl:call-template name="InvalidNumbersErrorMessage">
                <xsl:with-param name="num1" select="$num1"/>
                <xsl:with-param name="num2" select="$num2"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:when test="$num1 &gt;= $num2">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <num1><xsl:value-of select="$num1"/></num1>
                <not_greater_than_or_equals/>
                <num2><xsl:value-of select="$num2"/></num2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="EQUALS" mode="number_mode">
    <xsl:param name="num1"/>
    <xsl:param name="num2"/>

    <xsl:variable name="areNumbersValid">
        <result>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num1"/>
            </xsl:call-template>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num2"/>
            </xsl:call-template>
        </result>
    </xsl:variable>

    <xsl:choose>
        <xsl:when test="ms:node-set($areNumbersValid)//invalid_number">
            <xsl:call-template name="InvalidNumbersErrorMessage">
                <xsl:with-param name="num1" select="$num1"/>
                <xsl:with-param name="num2" select="$num2"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:when test="$num1 = $num2">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <num1><xsl:value-of select="$num1"/></num1>
                <not_equals/>
                <num2><xsl:value-of select="$num2"/></num2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="NOT_EQUALS" mode="number_mode">
    <xsl:param name="num1"/>
    <xsl:param name="num2"/>

    <xsl:variable name="areNumbersValid">
        <result>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num1"/>
            </xsl:call-template>
            <xsl:call-template name="IsNumberValid">
                <xsl:with-param name="number" select="$num2"/>
            </xsl:call-template>
        </result>
    </xsl:variable>

    <xsl:choose>
        <xsl:when test="ms:node-set($areNumbersValid)//invalid_number">
            <xsl:call-template name="InvalidNumbersErrorMessage">
                <xsl:with-param name="num1" select="$num1"/>
                <xsl:with-param name="num2" select="$num2"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:when test="$num1 != $num2">
            <xsl:attribute name="verdict">passed</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
            <xsl:attribute name="verdict">failed</xsl:attribute>
            <error_message>
                <num1><xsl:value-of select="$num1"/></num1>
                <equals/>
                <num2><xsl:value-of select="$num2"/></num2>
            </error_message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="IsNumberValid">
    <xsl:param name="number"/>

    <xsl:choose>
        <xsl:when test="string(number($number)) = 'NaN'"><invalid_number/></xsl:when>
        <xsl:otherwise><valid_number/></xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="InvalidNumbersErrorMessage">
    <xsl:param name="num1"/>
    <xsl:param name="num2"/>

    <xsl:attribute name="verdict">failed</xsl:attribute>
    <error_message>
        <invalid_numbers>
            <num1><xsl:value-of select="$num1"/></num1>
            <num2><xsl:value-of select="$num2"/></num2>
        </invalid_numbers>
    </error_message>
</xsl:template>

</xsl:stylesheet>
