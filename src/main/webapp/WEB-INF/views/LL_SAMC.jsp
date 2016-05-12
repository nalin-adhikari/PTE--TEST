<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
        
         <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/static/js/mytimer.js' />"></script>
        <script type="text/javascript">
            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/

            var time, counter;
            function init() {
                time = parseInt(document.getElementById("audioPlayAfter").value) * 1000;
                counter = time / 1000 - 1;
            }

            function playAudio() {
                var interval = setInterval(function () {
                    //alert(counter);
                    if (counter >= 0) {
                        document.getElementById("playsIn").innerHTML = counter;
                    }
                    counter--;
                    if (counter < 0) {
                        clearInterval(interval);
                        clearInterval();
                        document.getElementById("playing").innerHTML = "Playing...";
                    }
                }, 1000);
                setTimeout(function () {
                    document.getElementById('audiotag1').play();
                }, time);
            }
               
            function startExamTimer() {
                var duration = document.getElementById("categoryTime").value;
                var start = document.getElementById("startTimerAt").value;
                startTimer(duration, start);
            }
        </script>
    </head>
    <body onload="init();
        
            playAudio()">
        
         <%
            int startTime = 0;
           
            if ((session.getAttribute("startTime") != "") && (session.getAttribute("startTime") != null)) {
                startTime = Integer.parseInt(session.getAttribute("startTime").toString());
             
                
                
            }
            
int count=0;
   
            if ((session.getAttribute("question_count") != "") && (session.getAttribute("question_count") != null)) {
                count = Integer.parseInt(session.getAttribute("question_count").toString());
             
                
            }
        %>
        <c:forEach var="question" items="${listOfQuestions}">
            <div class="col-md-10 col-md-offset-1">
                <h1>Multiple-choice, choose single answers (Listening)</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
  <div>
                    Time: <span id="time">00:00</span>/<span id="duration"> <c:out value="${question.catId.totalTime/60}" />:00</span>
                </div>
                 <div>
                     <span id="time">1</span> 0f <span id="duration"> <c:out value="${count}" /></span>
                </div>
                <div class="question">
                    <c:out value="${question.question}" />
                </div>

                
                
                <div class="col-md-5 audioBox">
                    <h3 class="audioPlayer">Audio Player...<span class="text-success" id="playing">Plays in <span id="playsIn"><c:out value="${question.sectionId.audioPlayAfter}" /></span></span></h3>
                    <audio id="audiotag1" src="<c:url value='../media/files/${question.audioPath}' />"></audio>
                </div>
                <p class="clear" />

                <form action="" method="post">
                    <input type="hidden" value="${question.sectionId.audioPlayAfter}" id="audioPlayAfter" />
                    <input type="hidden" name="questionId" value="${question.questionId}" />
                    <div class="userspace">
                        <input type="radio" name="choice" value="_" checked="" class="hide"  />
                        <c:forEach var="options" items="${question.answerOptionsCollection}" varStatus="itr">

                            <input type="radio" name="choice" value="<c:out value='${options.ansOption}' />"><c:out value="${options.ansOption}" /><br/>
                        </c:forEach>
                        <input type="hidden" name="offset" value="<c:out value='${offset}' default='0' />" />
                        <input type="hidden" name="count" value="${count}" />
                        <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
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
