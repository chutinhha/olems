﻿using System;
namespace OLEMS.UserManagement
{
    public partial class ManageProfile : COLEMSPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/UserManagement/EditEmailAddress.aspx", true);
        }
    }
}
