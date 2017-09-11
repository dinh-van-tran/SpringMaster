<%@ include file="common/header.jspf" %>
<div class="container">
    <table class="table table-stripped">
        <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Date</th>
                <th>Completed</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${todos}" var="todo">
                <tr>
                    <td>${todo.user}</td>
                    <td>${todo.desc}</td>
                    <td>${todo.date}</td>
                    <td>${todo.done}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div>
        <a type="button" class="btn btn-success" href="/add-todo">Add</a>
    </div>
</div>
<%@ include file="common/footer.jspf" %>