﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopicManagement.aspx.cs" Inherits="OLEMS.QuestionDevelopment.TopicManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
         <title>Topic Management</title>
    </head>
<%-- baslik-----------------------------------------------------------------------------------------------------%>   
    <form id="form1" runat="server" title="Topic Management">
        <table width="100%">
            <tr>
                <td align="center" style="height: 21px">
                    <asp:Label ID="baslik" runat="server" Font-Bold="True" Font-Names="Arial" 
                     Font-Size ="Medium" ForeColor="#CC0000">TOPIC MANAGEMENT
                    </asp:Label>
                </td>
            </tr>
        </table>
        
        <body>
        <div>
        
        </div>
<%-- Topic sqldatasource-------------------------------------------------------------------------------------------------%>   
        <asp:SqlDataSource ID="Topic_SqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:IS50220082G4_ConnectionString %>" 
            SelectCommand="SELECT [name], [id] FROM [Topic]"
            InsertCommand="INSERT INTO [Topic] ([name]) VALUES (@name)"
            UpdateCommand="UPDATE [Topic] SET [name] = @name WHERE [id] = @id"
            DeleteCommand="DELETE FROM [Topic] WHERE [id] = @id">
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="id" Type="Object" />
            </InsertParameters>  
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="id" Type="Object"  />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Object"  />
            </DeleteParameters>
        </asp:SqlDataSource>
<%-- detailsview-----------------------------------------------------------------------------------------------------%>   
        <asp:DetailsView ID="TopicDetailsView" runat="server" 
            AutoGenerateDeleteButton="True" 
            AutoGenerateInsertButton="True" 
            AutoGenerateRows="False" 
            Font-Names="Arial" Font-Size="Small" 
            CellPadding="4" 
            DataSourceID="Topic_SqlDataSource" ForeColor="#333333" GridLines="None" 
            Style="z-index: 102; left: 193px;position: absolute; top: 95px; width: 509px;" 
            Height="50px" DefaultMode="Insert" AllowPaging="True" DataKeyNames="id" 
            HeaderText="CREATE TOPIC">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <Fields>
                <asp:TemplateField HeaderText="Topic Name" SortExpression="name">               
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic"
                              ID="reqValidator1" runat="server" 
                              ErrorMessage ="Please enter Topic name"                      
                              ControlToValidate="txtName" 
                              Font-Names="Arial" Font-Size="Small">
                        </asp:RequiredFieldValidator>  
                    </InsertItemTemplate>
                    
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
<%-- search button-----------------------------------------------------------------------------------------------------%>   
        <asp:LinkButton ID="lnkSearch" Font-Bold="true"  runat="server" Style="z-index: 101; left: 194px; position: absolute;
            top: 184px; height: 19px; right: 443px;" Width="100px" Font-Names="Arial" CausesValidation ="false"
                Font-Size="Small" ForeColor="Black" onclick="lnkSearch_Click" 
            ToolTip="Type a keyword in topic name and press this button for search">Search Topic(s)
        </asp:LinkButton>
<%-- gridview-----------------------------------------------------------------------------------------------------%>   
        <asp:GridView ID="TopicGridView" 
            runat="server" AllowPaging="True" 
            AllowSorting="True" CellPadding="4"  
            DataKeyNames= "id" 
            DataSourceID="Topic_SqlDataSource" 
            EmptyDataText="<B>No records found!</B>"
            Style="z-index: 101; left: 191px; position: absolute; top: 205px; height: 414px; width: 510px;" 
            ForeColor="#333333" GridLines="None" 
            Font-Names="Arial" Font-Size="Small" 
            AutoGenerateColumns="False" onrowediting="TopicGridView_RowEditing" 
                onrowupdated="TopicGridView_RowUpdated">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ValidationGroup="GV" ShowEditButton="True" ><ControlStyle Font-Bold="True" /></asp:CommandField>
                <asp:CommandField ShowDeleteButton="True"><ControlStyle Font-Bold="True" /></asp:CommandField>

                <asp:TemplateField HeaderText="Topic Name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTopicName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="GV" 
                              ID="reqValidator2" runat="server" 
                              ErrorMessage ="Please enter Topic name"                      
                              ControlToValidate="txtTopicName" 
                              Font-Names="Arial" Font-Size="Small">
                        </asp:RequiredFieldValidator>  
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                    SortExpression="id" Visible="False" />
            </Columns>
            <EmptyDataRowStyle ForeColor="Red" />       
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>  
        </body>     
    </form>

</html>
