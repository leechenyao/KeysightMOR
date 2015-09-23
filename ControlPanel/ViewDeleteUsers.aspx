<%@ Page Title="User Settings | Keysight Technologies" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="ViewDeleteUsers.aspx.cs" Inherits="KeysightMOR.ControlPanel.ViewDeleteUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/Stylesheets/controlpanel.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>

         .container
        {
            margin: 10px 50px 50px 50px;
        }
        .this_box
        {
            margin:20px auto 30px auto;
            background-color: #fff; 
            color: #000; 
            font-size: 16px;
            width: 1000px; 
              height: auto;        
            -moz-box-shadow: 0px 3px 6px #c9c9c9;
            -webkit-box-shadow: 0px 3px 6px #c9c9c9;
            box-shadow: 0px 3px 6px #c9c9c9;

        }
        .vdCM_table
        {
            width:90%; 
            background-color: #fff;
            text-align: left;
			overflow: auto;
            margin-bottom: 10px;
            margin-top: 10px;
            margin-left: 20px;
            border-spacing: 10px;
        }
        td
        {
            padding: 15px;
        }
        .cell_head
        {
            color: #6BB9F0;
            text-align: left;
            padding: 5px;
            font-size: 16px;
           
        }
        .del_link
        {
            text-decoration: none;
        }
        .del_link:hover
        {
            color: #F22613;
        }
        .cell_cmName
        {
            text-align:left;
        }
         /*-----PopUp styles----------*/
        
        .overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
  position: relative;
  transition: all .5s ease-in-out;
}

.popup h2 {
  margin-top: 0;
  color: #fff;
             background-color: #D64541; 
            font-size: 20px; 
            height: 60px; 
            line-height: 60px; 
            text-align: center;
}
.popup .close {
  position: absolute;
  top: 0px;
  right: 5px;
  transition: all 200ms;
  font-size: 40px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: gray;
}
.popup .content {
  max-height: 50%;
  overflow: auto;
  padding: 8px;
}


       .back_btn
        {
           padding: 3px 3px 3px 3px;
            margin-top: 20px;
            margin-left: 50px;                   
            text-align: center;
            display:inline-block;            
            font-size: 15px;
            font-family: 'Lato', sans-serif;
            color: #fff;
            background-color: #22A7F0;
            border: solid 5px #22A7F0;
            text-decoration: none;            
            cursor: pointer; 
            vertical-align: middle;     
        }
        .back_btn:hover
        {
            background-color: #3498DB;
            border: solid 5px #3498DB;
        }
    </style>

     <asp:Button ID="Button1" runat="server" Text="Back" class="back_btn" PostBackUrl="~/ControlPanel/Index.aspx"/>  
     <asp:Label ID="Label1" runat="server"></asp:Label>
    <center>
        
        <div class="container">
    <div class="this_box">       
        <h2>          
            View & Delete Users
        </h2>
        <br /><asp:Label ID="DeactivateUserStatus" runat="server" ForeColor="Green"></asp:Label>
        <fieldset style="padding-left:15px;">
            <p style="font-size:x-large; padding:0 0 15px 20px; text-align:left;"><u>Admin</u></p>
            <div style="text-align:center;">
            <asp:GridView ID="AdminList" runat="server" DataKeyNames="UserID" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." OnRowUpdating="AdminList_RowUpdating" RowStyle-HorizontalAlign="Center" GridLines="None" Width="800px">
                <AlternatingRowStyle BackColor="White" height="30px"/>
                <Columns>
                    <asp:BoundField DataField="UserID" Visible="false"><ItemStyle Width="200px"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="Name" SortExpression="UserName"><ItemStyle Width="200px"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="UserEmail" HeaderText="Email Address" SortExpression="UserEmail"><ItemStyle Width="200px"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position"><ItemStyle Width="200px"></ItemStyle></asp:BoundField>                   
                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="100px">
			        <ItemTemplate>
				        <asp:LinkButton ID="DeactiveUser" runat="server" CommandName="Update"
				        OnClientClick="return confirm('Are you sure you want to delete this User?');">Delete
				        </asp:LinkButton>
			        </ItemTemplate>
                    <ItemStyle Width="180px"></ItemStyle>
		        </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="#6BB9F0" height="30px"/>
                <RowStyle BackColor="#E3EAEB" height="30px"/>
            </asp:GridView>
                </div>
            <br /><p style="font-size:x-large;padding:0 0 15px 20px; text-align:left;"><u>Employee</u></p>
            <div>
            <asp:GridView ID="EmployeeList" runat="server" DataKeyNames="UserID" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." OnRowUpdating="EmployeeList_RowUpdating" RowStyle-HorizontalAlign="Center" GridLines="None" Width="978px">
                <AlternatingRowStyle BackColor="White" height="30px"/>
                <Columns>
                    <asp:BoundField DataField="UserID" Visible="false"><ItemStyle Width="200px"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="Name" SortExpression="UserName"><ItemStyle Width="200px"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="UserEmail" HeaderText="Email Address" SortExpression="UserEmail"><ItemStyle Width="200px"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position"><ItemStyle Width="200px"></ItemStyle></asp:BoundField>
                    <asp:BoundField DataField="DivName" HeaderText="Division" SortExpression="Division"><ItemStyle Width="200px"></ItemStyle></asp:BoundField>
                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="100px">
			        <ItemTemplate>
				        <asp:LinkButton ID="DeactiveUser" runat="server" CommandName="Update"
				        OnClientClick="return confirm('Are you sure you want to delete this User?');">Delete
				        </asp:LinkButton>
			        </ItemTemplate>
                    <ItemStyle Width="180px"></ItemStyle>
		        </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="#6BB9F0" height="30px"/>
                <RowStyle BackColor="#E3EAEB" height="30px"/>
            </asp:GridView>
                </div>
        </fieldset>

    </div>
        </center>  
    
      <!---- Delete Users Pop Up ----->  
    <div id="popup2" class="overlay">
	<div class="popup">
        <a class="close" href="#">×</a>
        <br />
		<h2 >Delete User</h2>
		
		<div class="content">
            <center>
<p>
    Are you sure you want to delete this user?
</p>
			
			<p>
                <div class="div_button">
                <asp:Button ID="Button3" runat="server" Text="Yes"  CssClass="action-button hvr-radial-out"/>
            &nbsp;&nbsp;
                            <asp:Button ID="Button4" runat="server" Text="No" CssClass="cancel_button" PostBackUrl="~/ControlPanel/ViewDeleteUsers.aspx"/>
            </div>
			</p>

            
                </center>
		</div>
	</div>
</div>
    
   
</asp:Content>
