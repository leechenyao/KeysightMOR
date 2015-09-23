<%@ Page Title="Contract Manufacturer Settings | Keysight Technologies" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="ViewDeleteCM.aspx.cs" Inherits="KeysightMOR.ControlPanel.ViewDeleteCM" %>

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
            text-align:center;
            font-size: 16px;
            width: 600px; 
              height: auto;        
            -moz-box-shadow: 0px 3px 6px #c9c9c9;
            -webkit-box-shadow: 0px 3px 6px #c9c9c9;
            box-shadow: 0px 3px 6px #c9c9c9;

        }
        .vdCM_table
        {
             width:70%; 
            background-color: #fff;

            text-align: left;
			overflow: auto;
            margin-bottom: 10px;
            margin-top: 10px;
           margin-left: 22%;
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
        .del_link
        {
            text-decoration: none;
        }
        .del_link:hover
        {
            color: #F22613;
        }
        .del_link:visited
        {
            color: #F22613;
            text-decoration: none;
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

   <center>
       <div class="container">

     
    <div class="this_box">       
        <h2>          
            View & Delete Contract Manufacturer
        </h2>   
        <br /><asp:Label ID ="DeleteCMStatus" runat="server" ForeColor="Green"></asp:Label>             
        <fieldset>
                <asp:GridView ID="CMList" runat="server" DataKeyNames="CMID" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." OnRowDeleting="CMList_RowDeleting" CellPadding="4" ForeColor="#333333" RowStyle-HorizontalAlign="Center" GridLines="None" Width="581px">
                    <AlternatingRowStyle BackColor="White" height="30px"/>
                    <Columns>
                        <asp:BoundField DataField="CMName" HeaderText="CM Name" SortExpression="CMName" />
                        <asp:BoundField DataField="CMID" SortExpression="CMName" Visible="false" />
                        <asp:TemplateField HeaderText="Actions">
			                <ItemTemplate >
				                <asp:LinkButton ID="DeleteCM" runat="server" CommandName="Delete"
				                OnClientClick="return confirm('Are you sure you want to delete this CM?');">Delete
				                </asp:LinkButton>
			                </ItemTemplate>
		                </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="#6BB9F0" height="30px"/>
                    <RowStyle BackColor="#E3EAEB" height="30px"/>            
                </asp:GridView>
                <br />
                             
              
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
    Are you sure you want to delete this CM?
</p>
			
			<p>
                <div class="div_button">
                <asp:Button ID="Button3" runat="server" Text="Yes"  CssClass="action-button hvr-radial-out"/>
            &nbsp;&nbsp;
                            <asp:Button ID="Button4" runat="server" Text="No" CssClass="cancel_button" PostBackUrl="~/ControlPanel/ViewDeleteCM.aspx"/>
            </div>
			</p>

            
                </center>
		</div>
	</div>
</div> 
        
       
</asp:Content>
