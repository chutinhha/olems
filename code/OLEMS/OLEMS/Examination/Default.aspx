<%@ Page Language="C#" MasterPageFile="~/OLEMS.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="OLEMS.Examination.Default" Title="<%$ Resources:PageTitle %>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        <asp:Label ID="PageHeader" runat="server" Text="<%$ Resources:PageHeader %>" />
    </h3>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="text-align: center" colspan="2">
                <h4 style="text-align: left">
                    <asp:Label ID="UpcomingExams" runat="server" Text="<%$ Resources:UpcomingExams %>" />
                </h4>
            </td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="2">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IS50220082G4_ConnectionString %>"
                    SelectCommand="selUpcomingExamsForStudent" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="StudentId" SessionField="StudentGUID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                    Width="100%" DataSourceID="SqlDataSource2">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
                <h4 style="text-align: left">
                    <asp:Label ID="AvailableAndCompletedExams" runat="server" Text="<%$ Resources:AvailableAndCompletedExams %>" />
                </h4>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblpass" runat="server" Text="  Starting Password  " Font-Names="Arial"
                    Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator Display="Dynamic" ID="reqValidator" runat="server" ErrorMessage="Please enter password"
                    ControlToValidate="txtPassword" Font-Names="Arial" Font-Size="Small">
                </asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Button ID="btnTakeExam" runat="server" Text="<%$ Resources:btnTakeExam %>" OnClick="btnTakeExam_Click" />
                <asp:Button ID="btnDisplayExamResult" runat="server" Text="<%$ Resources:btnDisplayExamResult %>"
                    OnClick="btnDisplayExamResult_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IS50220082G4_ConnectionString %>"
                    SelectCommand="SELECT [StudentExamination_id], [Section_name], [ExamType_name], [Exam_name], [Examination_Schedule], [Building_name], [Location_name],[Examination_id] FROM [vStudentExamination] WHERE ([StudentId] = @StudentId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="StudentId" SessionField="StudentGUID" Type="Object" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                    Width="100%" AutoGenerateColumns="False" DataKeyNames="StudentExamination_id"
                    DataSourceID="SqlDataSource1">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="StudentExamination_id" HeaderText="StudentExamination_id"
                            ReadOnly="True" SortExpression="StudentExamination_id" Visible="False" />
                        <asp:BoundField DataField="Section_name" HeaderText="Section_name" SortExpression="Section_name" />
                        <asp:BoundField DataField="ExamType_name" HeaderText="ExamType_name" SortExpression="ExamType_name" />
                        <asp:BoundField DataField="Exam_name" HeaderText="Exam_name" SortExpression="Exam_name" />
                        <asp:BoundField DataField="Examination_Schedule" HeaderText="Examination_Schedule"
                            SortExpression="Examination_Schedule" />
                        <asp:BoundField DataField="Building_name" HeaderText="Building_name" SortExpression="Building_name" />
                        <asp:BoundField DataField="Location_name" HeaderText="Location_name" SortExpression="Location_name" />
                        <asp:TemplateField HeaderText="Examination_id" SortExpression="Examination_id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblExaminationID" runat="server" Text='<%# Bind("Examination_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
