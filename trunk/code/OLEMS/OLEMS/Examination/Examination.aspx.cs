﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace OLEMS.Examination
{
    public partial class Examination : COLEMSPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (RadioButtonList1.SelectedIndex == -1)
                {
                    MultiView1.Visible = false;
                }
                else
                {
                    SqlConnection conn = new SqlConnection(GetConnectionString("IS50220082G4_ConnectionString"));

                    Guid gQuestionId = new Guid(RadioButtonList1.SelectedValue.ToString());

                    SqlCommand sqlQueryString = new SqlCommand();
                    sqlQueryString.CommandType = CommandType.Text;
                    sqlQueryString.CommandText = "SELECT QuestionType.pagePath FROM Question INNER JOIN QuestionType ON Question.questionTypeId = QuestionType.id WHERE (Question.id = @questionId)";
                    sqlQueryString.Connection = conn;

                    SqlParameter QuestionId = new SqlParameter("@questionId", SqlDbType.UniqueIdentifier);
                    QuestionId.Value = gQuestionId;
                    sqlQueryString.Parameters.Add(QuestionId);

                    object resultR = null;
                    ConnectionState previousConnectionState = conn.State;
                    try
                    {
                        if (conn.State == ConnectionState.Closed)
                        {
                            conn.Open();
                        }
                        resultR = sqlQueryString.ExecuteScalar();
                    }
                    finally
                    {
                        if (previousConnectionState == ConnectionState.Closed)
                        {
                            conn.Close();
                        }
                    }
                    if (resultR == null)
                    {
                        MultiView1.Visible = false;
                    }
                    else
                    {
                        switch (resultR.ToString())
                        {
                            case "FreeResponse":
                                MultiView1.Visible = true;
                                MultiView1.SetActiveView(FreeResponse);
                                break;
                            case "Matching":
                                MultiView1.Visible = true;
                                MultiView1.SetActiveView(Matching);
                                break;
                            case "TrueFalse":
                                MultiView1.Visible = true;
                                MultiView1.SetActiveView(TrueFalse);
                                break;
                            case "MultipleChoice":
                                MultiView1.Visible = true;
                                MultiView1.SetActiveView(MultipleChoice);
                                break;
                            default:
                                MultiView1.Visible = false;
                                break;
                        }
                    }
                }
            }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_DataBound(object sender, EventArgs e)
        {
                if (RadioButtonList1.Items.Count > 0)
            {
                foreach (ListItem li in RadioButtonList1.Items)
                {
                    SqlConnection conn = new SqlConnection(GetConnectionString("IS50220082G4_ConnectionString"));

                    Guid gQuestionId = new Guid(li.Value.ToString());
                    Guid gStudentExaminationId = new Guid(Session["StudentExaminationGUID"].ToString());

                    SqlCommand sqlQueryString = new SqlCommand();
                    sqlQueryString.CommandType = CommandType.Text;
                    sqlQueryString.CommandText = "SELECT CASE " +
    "WHEN COUNT(StudentExaminationQuestionsResponse.id) = 0 THEN 'True' " +
    "ELSE 'False' END AS 'Enabled' " +
    "FROM StudentExaminationQuestions INNER JOIN " +
    "Question ON dbo.StudentExaminationQuestions.questionId = Question.id LEFT OUTER JOIN " +
    "StudentExaminationQuestionsResponse ON " +
    "StudentExaminationQuestions.id = StudentExaminationQuestionsResponse.studentExaminationQuestionsId " +
    "WHERE ((StudentExaminationQuestions.studentExaminationId = @studentExaminationId) AND (StudentExaminationQuestions.questionId = @questionId))";
                    sqlQueryString.Connection = conn;

                    SqlParameter QuestionId = new SqlParameter("@questionId", SqlDbType.UniqueIdentifier);
                    QuestionId.Value = gQuestionId;
                    sqlQueryString.Parameters.Add(QuestionId);

                    SqlParameter StudentExaminationId = new SqlParameter("@studentExaminationId", SqlDbType.UniqueIdentifier);
                    StudentExaminationId.Value = gStudentExaminationId;
                    sqlQueryString.Parameters.Add(StudentExaminationId);

                    object resultE = null;
                    ConnectionState previousConnectionState = conn.State;
                    try
                    {
                        if (conn.State == ConnectionState.Closed)
                        {
                            conn.Open();
                        }
                        resultE = sqlQueryString.ExecuteScalar();
                    }
                    finally
                    {
                        if (previousConnectionState == ConnectionState.Closed)
                        {
                            conn.Close();
                        }
                    }
                    if (resultE == null)
                    {

                    }
                    else
                    {
                        Boolean boolEnabled = new Boolean();
                        Boolean.TryParse(resultE.ToString(), out boolEnabled);
                        li.Enabled = boolEnabled;
                    }
                }
}
        }
    }
}