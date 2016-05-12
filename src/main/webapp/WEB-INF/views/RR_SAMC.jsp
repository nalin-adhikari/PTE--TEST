<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
        <script type="text/javascript">
            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/
//            window.onbeforeunload = function (e) {
//                e = e || window.event;
//
//                // For IE and Firefox prior to version 4
//                if (e) {
//                    e.returnValue = 'You sure?';
//                }
//
//                // For others
//                return 'You sure?';
//            };
        </script>
    </head>
    <body>
        <c:forEach var="question" items="${listOfQuestions}">
            <div class="col-md-10 col-md-offset-1">
                <h1>Multiple-choice, choose single answer (Reading)</h1>

                <div class="question col-md-6" style="float: left;">
                    <c:out value="${question.passage}" />
                </div>

                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                </hr>
 <div>
                     <span id="time">1</span> 0f <span id="duration"> <c:out value="${count}" /></span>
                </div>
                <form action="" method="post">
                    <div class="userspace col-md-6">
                      
                        <input type="hidden" name="questionId" value="${question.questionId}" />
                        <input type="hidden" name="offset" value="<c:out default="0" value="${offset}" />" />
                        <input type="hidden" name="count" value="${count}" />
                        <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />

                        <p><c:out value="${question.question}" /></p>
                        <input type="radio" name="choice" value="_" checked="" class="hide"  />
                        <c:forEach var="options" items="${question.answerOptionsCollection}">

                            <input type="radio" name="choice" value="<c:out value='${options.ansOption}' />"><c:out value="${options.ansOption}" /><br/>
                        </c:forEach>
                    </div>
                        
                     <div>
                        <input type="submit" name="submit" value="Next" class="btn btn-primary" style="float:right" />
                    </div>

                </form>
               
                
            </div>
        </c:forEach>

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
