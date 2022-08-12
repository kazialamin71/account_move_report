<html>
    <head>
        <style type="text/css">
            ${css}
        </style>
    </head>
    <body>
        %for o in objects :
        <table width = '100%' class='td_company_title'>
            <tr>
                <td style="vertical-align: top;max-height: 45px;">
                    ${helper.embed_image('jpeg',str(o.company_id.logo),180, 85)}
                </td>
                <td>
                    <div>${o.company_id.name or ''|entity}</div>
                    <br>${o.company_id.partner_id.street or ''|entity} No. 
                                                ${o.company_id.partner_id.street2 or ''|entity}
                                                ${o.company_id.partner_id.zip or ''|entity}
                                                <br/>${o.company_id.partner_id.city or ''|entity}
                                                , ${o.company_id.partner_id.state_id.name or ''|entity}
                                                , ${o.company_id.partner_id.country_id.name or ''|entity}
                </td>
                <td>
                    <div>${_("Printing Date:")} ${time.strftime('%Y-%m-%d %H:%M:%S')}</div>
                </td>
            </tr>
        </table>                                   

        <table class='celdaDetailTitulo'>
            <tr>
                <div>
                    <td>${_("Journal Entries: ")} ${o.name or '' |entity}</td>
                </div>
            </tr>
            <tr>
                <div>
                    <td>${_("Reference: ")} ${o.ref or '' |entity}</td>
                </div>
            </tr>
            <tr width= '100%'>
                <div>
                    <td width= '50%'>
                        ${_("Period: ")} ${o.period_id.name or '' |entity}
                    </td>
                    <td width= '50%'>
                        ${_("Date: ")} ${o.date or '' |entity}
                    </td>  
                </div>
            </tr>
            <tr>
                <div>
                    <tr>
                        <td>
                            ${_("To Review: ")} 
                        </td>
                        <td>
                            %if o.to_check:
                                <p>&#10004;</p>
                            %endif
                        </td>
                    </tr>
                </div>
            </tr>
        </table>
        
        <table width= '100%' style="border-collapse: collapse;">
            <tr class='celdaTituloTabla'>

                <td style="font-size:20px;">
                    <div>${_("Name")}</div>
                </td>
                <td style="font-size:20px;">
                    <div>${_("Partner")}</div>
                </td>
                <td style="font-size:20px;">
                    <div>${_("Account")}</div>
                </td>
                <td style="font-size:20px;">
                    <div>${_("Due date")}</div>
                </td>
                <td style="font-size:20px; width:10%;">
                    <div>${_("Debit")}</div>
                </td>
                <td></td>
                <td style="font-size:20px;">
                    <div>${_("Credit")}</div>
                </td>
            </tr>
            %for line in o.line_id:
            <tr class='celdaDetail'>

                <td style="word-wrap: break-word; font-size:20px;">
                    <div>${line.name or '' |entity}</div>
                </td>
                <td style="font-size:20px;">
                    <div>${line.partner_id.name or ''}</div>
                </td>
                <td style="font-size:20px;">
                    <div>${line.account_id.code or '' |entity} - ${line.account_id.name or '' |entity}</div>
                </td>
                <td style="font-size:20px;">
                    <div>${line.date_maturity or '' |entity}</div>
                </td>
                <td style="font-size:20px; width:10%;">
                    <div>${formatLang(line.debit or 0.0) |entity}</div>
                </td>
                <td></td>
                <td style="font-size:20px;">
                    <div>${formatLang(line.credit or 0.0) |entity}</div>
                </td>

            </tr>
            %endfor
            <tr class='celdaTotal'>
                <td colspan="4"></td>
                <td style="font-size:20px; text-align:left; width:10%;">
                    <div width='6%'>${formatLang(get_total_debit_credit(o.line_id)['sum_tot_debit'] or 0.0) |entity}</div>
                </td>
                <td></td>
                <td style="font-size:20px; text-align:right;">
                    <div width='6%'>${formatLang(get_total_debit_credit(o.line_id)['sum_tot_credit'] or 0.0) |entity}</div>
                </td>
                <td></td>
            </tr>
            
        </table>
        %if len(loop._iterable) != 1 and loop.index != len(loop._iterable)-1:
            <p style="page-break-after:always"></p>
        %endif
    %endfor
    </body>
</html>
