using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxCallback;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindPagedData(0);
    }
    protected void ASPxCallback1_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
        int pageIndex = int.Parse(e.Parameter);
        int pageCount = BindPagedData(pageIndex);
        e.Result = ASPxCallback.GetRenderResult(Repeater1);
        ASPxCallback1.JSProperties["cpIsEnd"] = pageIndex == (pageCount - 1);

        // Intentionally pauses server-side processing,
        // to demonstrate the Loading Panel functionality. 
        System.Threading.Thread.Sleep(500);
    }
    private int BindPagedData(int pageIndex) {
        // Here you can put your custom code to fetch a portion of data from your datasource
        PagedDataSource pds = new PagedDataSource();
        pds.AllowPaging = true;
        pds.PageSize = 10;
        pds.CurrentPageIndex = pageIndex;
        pds.DataSource = AccessDataSource1.Select(new DataSourceSelectArguments());
        
        Repeater1.DataSource = pds;
        Repeater1.DataBind();

        return pds.PageCount;
    }
}