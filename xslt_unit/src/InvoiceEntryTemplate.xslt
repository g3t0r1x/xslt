<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:ms="urn:schemas-microsoft-com:xslt"
                              exclude-result-prefixes="ms">

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:variable name="InvoiceBodyType">
    <xsl:choose>
        <xsl:when test="//transaction[@name='Priority']">SuperInvoice</xsl:when>
        <xsl:otherwise>NormalInvoice</xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:variable name="InvoiceTableData">
    <data>
        <xsl:apply-templates select="//transaction" mode="data_transform"/>
    </data>
</xsl:variable>

<xsl:template match="/">
    <html>
        <body>
            <table id="transaction_table">
                <tbody>
                    <xsl:apply-templates select="ms:node-set($InvoiceTableData)/data/row[1]" mode="print_table_headers"/>
                    <xsl:apply-templates select="ms:node-set($InvoiceTableData)/data/row" mode="print_table_data"/>
                </tbody>
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="transaction" mode="data_transform">
    <row>
        <column name="InvoiceType"><xsl:value-of select="@name"/></column>
        <column name="InvoiceAmount">$<xsl:value-of select="./value"/></column>
        <column name="InvoiceRecipient"><xsl:value-of select="./person"/></column>
    </row>
</xsl:template>

<xsl:template match="row" mode="print_table_headers">
    <tr>
        <xsl:for-each select="./column">
            <th><xsl:value-of select="@name"/></th>
        </xsl:for-each>
    </tr>
</xsl:template>

<xsl:template match="row" mode="print_table_data">
    <tr>
        <xsl:for-each select="./column">
            <td><xsl:value-of select="."/></td>
        </xsl:for-each>
    </tr>
</xsl:template>

</xsl:stylesheet>