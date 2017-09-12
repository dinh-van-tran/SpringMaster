<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<div class="container">
    <form:form method="post" commandName="todo">
        <input type="hidden" name="_csrf" value="${_csrf.token}" >
        <input type="hidden" name="id" value="${todo.id}" >
        <div class="form-group">
            <label for="desc">Description:</label>
            <input id="desc" type="text" name="desc" class="form-control" required="required" pattern=".{10,}" value="${todo.desc}"/>
        </div>
        <div class="form-group">
            <label for="targetDate">Target Date:</label>
            <input id="targetDate" type="date" name="targetDate" class="form-control" required="required" value="${todo.targetDate}"/>
        </div>
        <button id="submit" type="submit" class="btn btn-success">Submit</button>
        <button type="reset" class="btn btn-warning">Reset</button>
    </form:form>
</div>
<%@ include file="common/footer.jspf" %>
<script>
$(function() {
    $("#desc").get(0).oninvalid = function() {
        this.setCustomValidity("Please enter at least 10 characters");
        this.setCustomValidity("");
    };
});
</script>