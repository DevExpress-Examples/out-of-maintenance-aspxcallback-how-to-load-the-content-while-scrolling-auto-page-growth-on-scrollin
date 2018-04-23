Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxCallback

Partial Public Class _default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        BindPagedData(0)
    End Sub
    Protected Sub ASPxCallback1_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Dim pageIndex As Integer = Integer.Parse(e.Parameter)
        Dim pageCount As Integer = BindPagedData(pageIndex)
        e.Result = ASPxCallback.GetRenderResult(Repeater1)
        ASPxCallback1.JSProperties("cpIsEnd") = pageIndex = (pageCount - 1)

        ' Intentionally pauses server-side processing,
        ' to demonstrate the Loading Panel functionality. 
        System.Threading.Thread.Sleep(500)
    End Sub
    Private Function BindPagedData(ByVal pageIndex As Integer) As Integer
        ' Here you can put your custom code to fetch a portion of data from your datasource
        Dim pds As New PagedDataSource()
        pds.AllowPaging = True
        pds.PageSize = 10
        pds.CurrentPageIndex = pageIndex
        pds.DataSource = AccessDataSource1.Select(New DataSourceSelectArguments())

        Repeater1.DataSource = pds
        Repeater1.DataBind()

        Return pds.PageCount
    End Function
End Class