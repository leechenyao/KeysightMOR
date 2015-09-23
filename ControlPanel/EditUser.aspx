<%@ Page Title="Edit User Settings | Keysight Technologies" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="KeysightMOR.ControlPanel.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/Stylesheets/controlpanel.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

                .container
        {
            margin: 0px 50px 50px 50px;
        }
        .this_box
        {
            margin:50px auto 30px auto;
            background-color: #fff; 
            color: #000; 
            font-size: 16px;
            width: 1000px; 
              height: auto;        
            -moz-box-shadow: 0px 3px 6px #c9c9c9;
            -webkit-box-shadow: 0px 3px 6px #c9c9c9;
            box-shadow: 0px 3px 6px #c9c9c9;

        }
        .editU_table
        {
             width:80%; 
            background-color: #fff;

            text-align: left;
			overflow: auto;
            margin-bottom: 10px;
            margin-top: 10px;
           margin-left: 20px;
            align-content: center;
            border-collapse: separate;
            border-spacing: 0px;
        }
        .cell_head
        {
            color: #6BB9F0;
            text-align: left;
            padding: 5px;
            font-size: 18px;
           
        }
        .edit_link
        {
            text-decoration: none;
        }
        .edit_link:hover
        {
            color: #F22613;
        }
        .cell_uName
        {
            text-align:left;
        }

        h3
        {
            color: #fff;
            background-color: #6BB9F0;
            text-align: center;
            line-height: 30px;
            height: 30px;
            font-size:18px;
        }
        /*-----Edit User pop up styles----------*/
        
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
.popup .close, .popup2 .close {
  position: absolute;
  top: 0px;
  right: 5px;
  transition: all 200ms;
  font-size: 40px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover  , .popup2 .close:hover{
  color: gray;
}
.popup .content {
  max-height: 50%;
  overflow: auto;
  padding: 8px;
}
.popup .popup_table
{
    border-spacing: 20px 10px 10px 10px;
    text-align: left;
}

/*---Edit Div pop up styles-----*/
.popup2 {
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 65%;
  position: relative;
  transition: all .5s ease-in-out;
  height:400px;
}

.popup2 h2 {
  margin-top: 0;
  color: #fff;
             background-color: #D64541; 
            font-size: 20px; 
            height: 60px; 
            line-height: 60px; 
            text-align: center;
}
.editdiv_table
        {
           width:95%; 
            background-color: #fff;

            text-align: left;
			overflow: auto;
            margin-bottom: 10px;
            margin-top: 8px;
           margin-left: 22px;
            align-content: center;
            border-collapse: separate;
            border-spacing: 0px;
           
        }
.editdiv_table td
{
    border:none;
}
.td_h3
{
    width: 350px;
    text-align: center;
}
.popupButton
{
   
font-family: 'Lato', sans-serif;
font-size: 16px;
font-weight: 500;
            color: #fff;  
            background-color:#36D7B7;  
            border-color: #36D7B7;     
            text-decoration: none;
            cursor: pointer; 
         width:70px;
          height:40px ;  
          padding: 5px 5px 5px 5px;
}
.list_box
{
    font-family: 'Lato', sans-serif;
font-size: 16px;
border: solid #BDC3C7 2px;
}

.cell_buttons
{
    padding-left: 20px; 
    padding-right: 20px;
    text-align: center;
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

   <asp:Button ID="Button3" runat="server" Text="Back" class="back_btn" PostBackUrl="~/ControlPanel/Index.aspx"/>  
   <center>
       <div class="container">

       
    <div class="this_box">       
        <h2>   
            Edit Users
        </h2>
        <fieldset>
   <asp:Label ID="EditUserStatus" runat="server" ForeColor="Green"></asp:Label>
                <asp:GridView ID="UserList" runat="server" DataKeyNames="UserID" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." OnRowEditing="UserList_RowEditing" OnRowUpdating="UserList_RowUpdating" OnRowCancelingEdit="UserList_RowCancelingEdit" RowStyle-HorizontalAlign="Center" GridLines="None" Width="979px">
                        <AlternatingRowStyle BackColor="White" height="30px"/>
                        <Columns>
                            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" ItemStyle-Width="200px" InsertVisible="False" ReadOnly="True" Visible="false">
                                <ItemStyle Width="200px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="UserName" HeaderText="Name" SortExpression="UserName" ItemStyle-Width="200px" InsertVisible="False" ReadOnly="True">
                                <ItemStyle Width="200px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="UserEmail" HeaderText="Email Address" SortExpression="UserEmail" ItemStyle-Width="200px" InsertVisible="False" ReadOnly="True">
                                <ItemStyle Width="200px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" ItemStyle-Width="200px" InsertVisible="False" ReadOnly="True">
                                <ItemStyle Width="200px"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Division" SortExpression="Division">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DivName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate><div style="overflow:auto; height:150px; padding:0">
                                    <asp:GridView ID="DivisionList" runat="server" AutoGenerateColumns="False" DataKeyNames="DivID" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." GridLines="None">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="SelectDivision" runat="server"></asp:CheckBox>
                                            </ItemTemplate>                   
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DivID" SortExpression="DivID" Visible="false"/>    
                                        <asp:BoundField DataField="DivName" HeaderText="Division" SortExpression="DivName" />                                     
                                    </Columns>
                                    </asp:GridView>  </div>
                                </EditItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="100px">
			                    <ItemTemplate>
				                    <asp:LinkButton ID="EdituserDivision" runat="server" CommandName="edit">Edit Division</asp:LinkButton>
			                    </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="UpdateuserDivision" runat="server" CommandName="update">Update</asp:LinkButton>
                                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                                </EditItemTemplate>
                                <ItemStyle Width="180px"></ItemStyle>
		                    </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="#6BB9F0" height="30px"/>
                        <RowStyle BackColor="#E3EAEB" height="30px"/>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:KeysightMORConnectionString1 %>" 
                    ProviderName="<%$ ConnectionStrings:KeysightMORConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT * FROM [Division] ORDER BY DivName"></asp:SqlDataSource>       
         </fieldset>
    </div>
</div>
        </center>          
                   
     <!---- Edit Position Pop Up ----->

    <div id="popup1" class="overlay">
	<div class="popup">
        <a class="close" href="#">×</a>
        <br />
		<h2 >Edit Position</h2>
		
		<div class="content">
            <center><p class="title-description">Edit user's position</p>

			
                <table class="popup_table">
                    <tr>
                        <td>
                             <asp:RadioButton ID="RadioButton1" runat="server" GroupName="userPosition"/> &nbsp;&nbsp; Employee
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="userPosition" /> &nbsp;&nbsp; Administrator
                        </td>
                        
                    </tr>
                </table>
                <p>
                    
                <div class="div_button">
                <asp:Button ID="Button1" runat="server" Text="Save"  CssClass="action-button hvr-radial-out"/>
            &nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="cancel_button" PostBackUrl="~/ControlPanel/EditUser.aspx"/>
            </div>

			</p>
                </center>
                     
                            
            </div>  
    </div>
        </div>
    
      <!---- Edit Division Pop Up ----->

    <div id="popup2" class="overlay">
	<div class="popup2">
        <a class="close" href="#">×</a>
        <br />
		<h2 >Edit Division</h2>
		
		<div class="content">
            <center><p class="title-description">Edit user's division</p>

			
                <table class="editdiv_table">
                    <tr>
                        <td align="center" class="td_h3">
                            <h3 >Available Division</h3>
                        </td>
                        <td></td>
                        <td align="center" class="td_h3">
                            <h3 >Assigned Division</h3>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:ListBox ID="ListBox1" runat="server" Height="200px" Width="350px" CssClass="list_box">
                            <asp:ListItem>CSB - Little Falls</asp:ListItem>
                            <asp:ListItem>CTD</asp:ListItem>
                            <asp:ListItem>SA</asp:ListItem>
                            
                            </asp:ListBox></td>
                        <td class="cell_buttons">
                            <p>
                                <asp:Button ID="Button5" runat="server" Text=">>"  CssClass="popupButton"/>
                            </p>
                            <p>
                                <asp:Button ID="Button6" runat="server" Text="<<" CssClass="popupButton"/>
                            </p>
                           <p>
                                <asp:Button ID="Save" runat="server" Text="Save" CssClass="popupButton"/>
                           </p>
                           <p>
                               <asp:Button ID="Button7" runat="server" Text="Cancel" CssClass="popupButton"/>
                           </p>
                            
                        </td>
                        <td><asp:ListBox ID="ListBox2" runat="server"  Height="200px" Width="350px" CssClass="list_box">
                             <asp:ListItem>MBO Classic - Momentum</asp:ListItem>
                            <asp:ListItem>MBO - Non Classic</asp:ListItem>
                            <asp:ListItem>Wong Bee (MMA)</asp:ListItem>
                            <asp:ListItem>MBO</asp:ListItem>
                            
                        </asp:ListBox></td>
                    </tr>
                </table>
               
                            
            </div>  
    </div>
        </div>
                   
</asp:Content>
