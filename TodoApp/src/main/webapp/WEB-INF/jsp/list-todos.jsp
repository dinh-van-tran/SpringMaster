<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<div class="container">
    <table class="table table-striped">
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
                        <input type="hidden" name="id" value="${todo.id}" />
	                    <button type="button" class="btn btn-warning" name="delete">Delete</button>
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
        var header = $("meta[name='_csrf_header']").attr("content");
        var id = $(this).prev().val().toString();
        var div = $(this).parent().parent();
        $.ajax({
            url: "/delete-todo",
            type: "POST",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: {id: id},
            success: function (data) {
                if(data) {
                    console.log(data);
                    div.remove();
                }
            }
        });
    }); 
});
</script>