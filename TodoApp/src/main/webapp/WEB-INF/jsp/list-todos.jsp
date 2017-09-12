<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<div class="container">
    <table class="table table-striped">
        <caption><spring:message code="todo.caption"/></caption>
        <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Date</th>
                <th>Completed</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${todos}" var="todo">
                <tr>
                    <td>${todo.user}</td>
                    <td>${todo.desc}</td>
                    <td>${todo.targetDate}</td>
                    <td>${todo.done}</td>
                    <td>
                        <a type="button" href="/update-todo?id=${todo.id}" class="btn btn-warning">Update</a>
	                    <button type="button" class="btn btn-danger" name="delete">Delete</button>
                        <input type="hidden" name="id" value="${todo.id}" />
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div>
        <a type="button" class="btn btn-success" href="/add-todo">Add</a>
    </div>
</div>
<%@ include file="common/footer.jspf" %>
<script>
$(document).ready(function(){
    $("[name='delete']").click(function() {
        var token = $("meta[name='_csrf']").attr("content");
        var id = $(this).next().val().toString();
        var div = $(this).parent().parent();
        $.post("/delete-todo", {
            id: id,
            _csrf: token
        }, function(data) {
            if(data) {
                div.remove();
            }
        });
    }); 
});
</script>