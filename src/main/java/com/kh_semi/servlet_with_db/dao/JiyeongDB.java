package com.kh_semi.servlet_with_db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class JiyeongDB {
    /**
     * User테이블의 모든것을 가져오는 Function
     * 
     * @param getUser
     * @return
     * @throws SQLException
     */
    public ArrayList<HashMap> getUsers(String getUser) throws SQLException {
 
        Commons commons = new Commons();
        Statement statement = commons.getStatement();
        String query = "SELECT * FROM USER ";
        ResultSet resultSet = statement.executeQuery(query);

        ArrayList<HashMap> user_list = new ArrayList<HashMap>();

        while (resultSet.next()) {
            HashMap<String, Object> user = new HashMap<String, Object>();
            user.put("NAME", resultSet.getString("NAME"));
            user.put("USER_ID", resultSet.getString("USER_ID"));
            user.put("PASSWORD", resultSet.getString("PASSWORD"));
            user.put("PHONE_NUMBER", resultSet.getString("PHONE_NUMBER"));
            user.put("USER_EMAIL", resultSet.getString("USER_EMAIL"));
            user.put("ADDRESS", resultSet.getString("ADDRESS"));
            user.put("ADDRESSADD", resultSet.getString("ADDRESSADD"));
            user.put("SURVEYED", resultSet.getString("SURVEYED"));
            user.put("JOIN_DATE", resultSet.getString("JOIN_DATE"));

            user_list.add(user);

        }
        return user_list;

    }

    // Survey_INFO 테이블 전체를 가져오는 function
    public ArrayList<HashMap> getSurveysInfo(String surveyInfo_Uid) throws SQLException {

        Commons commons = new Commons();
        Statement statement = commons.getStatement();
        String query = "SELECT * FROM SURVEY_INFO ";
        ResultSet resultSet = statement.executeQuery(query);

        ArrayList<HashMap> surveyInfo_list = new ArrayList<HashMap>();

        while (resultSet.next()) {
            HashMap<String, Object> surveyInfo = new HashMap<String, Object>();
            surveyInfo.put("SURVEY_UID", resultSet.getString("SURVEY_UID"));
            surveyInfo.put("SURVEY_NAME", resultSet.getString("SURVEY_NAME"));
            surveyInfo.put("SURVEY_COMMENT", resultSet.getString("SURVEY_COMMENT"));
            surveyInfo.put("SURVEY_START_DATE", resultSet.getString("SURVEY_START_DATE"));
            surveyInfo.put("SURVEY_END_DATE", resultSet.getString("SURVEY_END_DATE"));
            surveyInfo.put("SURVEY_UP_DATE", resultSet.getString("SURVEY_UP_DATE"));

            surveyInfo_list.add(surveyInfo);
        }
        return surveyInfo_list;
    }

    public HashMap<String, Object> getSurveyInfoUid(String surveysUid) throws SQLException {
        Commons commons = new Commons();
        Statement statement = commons.getStatement();

        String query = "SELECT * FROM SURVEY_INFO " +
                " WHERE SURVEY_UID = '" + surveysUid + "'";

        ResultSet resultSet = statement.executeQuery(query);
        HashMap<String, Object> result = null;
        while (resultSet.next()) {
            result = new HashMap<>();
            result.put("SURVEY_UID", resultSet.getString("SURVEY_UID"));
            result.put("SURVEY_NAME", resultSet.getString("SURVEY_NAME"));
            result.put("SURVEY_COMMENT", resultSet.getString("SURVEY_COMMENT"));
            result.put("SURVEY_START_DATE", resultSet.getString("SURVEY_START_DATE"));
            result.put("SURVEY_END_DATE", resultSet.getString("SURVEY_END_DATE"));
        }
        return result;
    }

    public ArrayList<HashMap> getQuestionAnswer(String surveysUid) throws SQLException {

        Commons commons = new Commons();
        Statement statement = commons.getStatement();
        String query = "SELECT QUESTION.QUESTION, ANSWER.ANSWER, ANSWER.ORDERS " +
                "FROM QUESTION_ANSWERS " +
                "INNER JOIN QUESTION ON QUESTION.QUESTION_ID = QUESTION_ANSWERS.QUESTION_ID " +
                "INNER JOIN ANSWER ON ANSWER.ANSWER_ID = QUESTION_ANSWERS.ANSWER_ID " +
                "WHERE Survey_UID = '" + surveysUid + "' ";
        ResultSet resultSet = statement.executeQuery(query);
        ArrayList<HashMap> question_answer_list = new ArrayList<HashMap>();
        while (resultSet.next()) {
            HashMap<String, Object> question_answer = new HashMap<String, Object>();
            question_answer.put("QUESTION", resultSet.getString("QUESTION"));
            question_answer.put("ANSWER", resultSet.getString("ANSWER"));
            question_answer.put("ORDERS", resultSet.getInt("ORDERS"));

            question_answer_list.add(question_answer);
        }
        return question_answer_list;
    }

    public HashMap<String, Object> getUserId(String userId) throws SQLException{
        Commons commons = new Commons();
        Statement statement = commons.getStatement();

        String query = "SELECT * FROM USER " +
                        " WHERE USER_ID = '" + userId + "'";

        ResultSet resultSet = statement.executeQuery(query);
        HashMap<String, Object> result = null;
        while (resultSet.next()) {
            result = new HashMap<>();
            result.put("NAME", resultSet.getString("NAME"));
            result.put("USER_ID", resultSet.getString("USER_ID"));
            result.put("PASSWORD", resultSet.getString("PASSWORD"));
            result.put("PHONE_NUMBER", resultSet.getString("PHONE_NUMBER"));
            result.put("USER_EMAIL", resultSet.getString("USER_EMAIL"));
            result.put("ADDRESS", resultSet.getString("ADDRESS"));
            result.put("JOIN_DATE", resultSet.getString("JOIN_DATE"));
        }
        return result;
    }

}
