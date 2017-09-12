<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<div class="container">
    <form action="/add-todo" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" >
        <div class="form-group">
            <label for="desc">Description:</label>
            <input id="desc" type="text" name="desc" class="form-control" required="required"/>
        </div>
        <div class="form-group">
            <label for="targetDate">Target Date:</label>
            <input id="targetDate" type="date" name="targetDate" class="form-control" required="required"/>
        </div>
        <button type="submit" class="btn btn-success">Submit</button>
        <button type="reset" class="btn btn-warning">Reset</button>
    </form>
</div>
<%@ include file="common/footer.jspf" %>