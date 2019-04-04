<!-- default file list -->
*Files to look at*:

* [default.aspx](./CS/default.aspx) (VB: [default.aspx](./VB/default.aspx))
* [default.aspx.cs](./CS/default.aspx.cs) (VB: [default.aspx.vb](./VB/default.aspx.vb))
<!-- default file list end -->
# ASPxCallback - How to load the content while scrolling - Auto page growth on scrolling down


<p>This sample demonstrates how to implement automatic (on-demand) loading of items when a page's bottom is reached during scrolling the page down.</p><p>This behavior is widely used on modern and popular websites, such as facebook.com, bing.com, twitter.com, etc. This behavior is useful when there is a lot of data to be presented on a page, but it is not necessary to load and display all the data at a time since the most part of it might not be needed for a user. However, if the user scrolls the page down and is interested in seeing more data, it can be automatically loaded.</p><p>In this demo, we use the ASPxCallback, ASPxLoadingPanel, and ASPxPanel controls together with useful JavaScript methods available via our ASPxClientUtils object.</p><p>To track the moment when new data should be loaded, we handle the 'scroll' event of the browser window. When scrolling reaches the page's bottom, we generate a callback (using ASPxCallback) to obtain a new data portion from the server. Then, we add the received items to the end of the dataContainerElement DIV element.</p><p>As an example, we demonstrate how data can be passed from the server to the client using the JSProperties property, which is exposed by our AJAX-enabled web controls. In this sample, we pass the 'cpIsEnd' flag from the server to indicate that the end of a data list is reached, and the there is nothing to load.</p><p>Update.</p><p>You can get the same functionality (i.e., load the content while page scrolling) out of the box with our <a href="http://demos.devexpress.com/ASPxImageAndDataNavigationDemos/DataView/EndlessPaging.aspx"><u>ASPxDataView</u></a>, <a href="http://demos.devexpress.com/ASPxImageAndDataNavigationDemos/NewsControl/Features.aspx"><u>ASPxNewsControl</u></a>, <a href="http://demos.devexpress.com/ASPxImageAndDataNavigationDemos/ImageGallery/ResponsiveLayout.aspx"><u>ASPxImageGallery</u></a>, and <a href="http://demos.devexpress.com/ASPxGridViewDemos/PagingAndScrolling/EndlessPaging.aspx"><u>ASPxGridView</u></a> controls.</p><p>See the Endless Paging demo:</p><p><a href="http://demos.devexpress.com/ASPxImageAndDataNavigationDemos/DataView/EndlessPaging.aspx">http://demos.devexpress.com/ASPxImageAndDataNavigationDemos/DataView/EndlessPaging.aspx</a></p>

<br/>


