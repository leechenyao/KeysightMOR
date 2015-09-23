<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="EvaluationSetting.aspx.cs" Inherits="KeysightMOR.ControlPanel.EvaluationSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/Stylesheets/controlpanel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box">
        <h2>Evaluation Settings</h2>
        <br />
        <p>Select User for <asp:Label runat="server" ID="criteria"/></p>
        <p><asp:Label ID="AddUserCriteriaStatus" runat="server" ForeColor="Green"></asp:Label></p>
        <div align="center" style="overflow:auto; height:300px; padding:0">
            <asp:GridView ID="UserDivisionList" runat="server" DataKeyNames="UserDivID"  AutoGenerateColumns="False" EmptyDataText="There are no data records to display." HorizontalAlign="Center" GridLines="None" Width="300px" >
                <AlternatingRowStyle BackColor="White" height="20px"/>
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectUserDivision" runat="server"></asp:CheckBox>
                        </ItemTemplate>                   
                    </asp:TemplateField>    
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="DivName" HeaderText="Division" SortExpression="Division" />
                    <asp:BoundField DataField="UserDivID" SortExpression="UserDivID" Visible="false"/>
                </Columns>
                <HeaderStyle Font-Bold="True" height="20px" HorizontalAlign="Left"/>
                <RowStyle BackColor="#E3EAEB" height="20px"/>
            </asp:GridView>
        </div>
        <br />     
        <p>
            <asp:Button ID="Submit" runat="server" Text="Save" class="action-button hvr-radial-out" OnClick="Submit_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Cancel" runat="server" Text="Cancel" class="cancel_button" />
        </p>
    </div>
</asp:Content>
