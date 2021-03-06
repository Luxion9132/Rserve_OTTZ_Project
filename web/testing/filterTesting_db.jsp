<%-- 
    Document   : filter_sql
    Created on : 2014/4/18, 上午 01:45:42
    Author     : Leon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/OTTZ_general.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/formwizard.css" />
        <title>JSP Page</title>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/formwizard.js" type="text/javascript">

        /***********************************************
        * jQuery Form to Form Wizard- (c) Dynamic Drive (www.dynamicdrive.com)
        * This notice MUST stay intact for legal use
        * Visit http://www.dynamicdrive.com/ for this script and 100s more.
        ***********************************************/

        </script>
        
        <script type="text/javascript">            
        
        var myform=new formtowizard({
                formid: 'filterForm',
                persistsection: true,
                revealfx: ['slide', 500],
                validate: ['date1']                
        })

        </script>
        
    </head>
    <body>
        <!--置入網頁開頭 用於logo等物件-->
        <%@include file="/header.jsp"%> 
        <!--置入網頁選單--> 
        <%@include file="/mainMenu.jsp" %>    
        <hr style="size:4px">
        <div class="TopTitle">
            <h1 style="text-align: center">Filter Testing</h1>
            <h2 style="text-align: center">Data Source: SQL Server</h2>
        </div>
        
        <div class="selectionMain">
            <form action="${pageContext.request.contextPath}/FilterTesting_Servlet" method="post" name="filterForm" id="filterForm">
            <!--給servlet的資料來源參數-->
            <input type='hidden' name='datasource' value='db'/>
            <!--第一頁-->
            <fieldset class="sectionwrap" style="width: 800px">
                <legend>輸入代號與日期</legend>               
                <table border="0" class="selectionTable">  
                    <tr>
                        <td>測試股票代號</td>
                        <td><input type="text" name="testStockSymbol" value="2330"></td>
                    </tr>
                        <td>測試開始日期</td>
                        <td>                            
                            <input type = "date" name = "testStartDate" value = "2013-08-01"/>
                            <input type="time" name="testStartTime" value="08:30"/> 
                        </td>
                    </tr>
                    <tr>
                        <td>測試開始日期</td>
                        <td>                            
                            <input type = "date" name = "testEndDate" value = "2013-08-02"/>
                            <input type="time" name="testEndTime" value="13:00"/> 
                        </td>                       
                    </tr>
                </table>
                
            </fieldset>
            
            <!--第二頁-->
            <fieldset class="sectionwrap" style="width: 800px">
                <legend>輸入測試參數</legend>
                <table border="0" class="selectionTable">  
                    <tr>
                        <td>參數 N</td>                        
                        <td>
                            <!--queryString sendFilter為true則帶入bestN做預設值 否則為2-->
                            <input type="text" name="bestN" value="<%= "true".equals(request.getParameter("sendFilter"))? request.getParameter("bestN") : 2 %>">
                        </td>
                    </tr>
                    <tr>
                        <td>參數 K</td>
                        <td>
                            <!--queryString sendFilter為true則帶入bestK做預設值 否則為0.12-->
                            <input type = "text" name = "bestK" value = "<%= "true".equals(request.getParameter("sendFilter"))? request.getParameter("bestK") : 0.12 %>"/>
                        </td>
                    </tr>
                    
                </table>
            </fieldset>

            <!--最終頁 確認與送出-->
            <fieldset class="sectionwrap" style="width: 800px">
                <legend>最終確認</legend>
                <table class="selectionTable">                   
                    <tr>
                        <td colspan="100">
                            <input type="submit" value="送出">
                            <input type="reset" name="Reset" id="button" value="清除">
                        </td>
                    </tr>                
                </table>
            </fieldset>
            </form>
        </div>
                        
        <!--置入網頁註腳 權責聲明等物件-->    
        <%@include file="/footer.jsp" %>
    </body>
</html>