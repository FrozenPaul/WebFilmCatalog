<#import "parts/common.ftl" as c>

<@c.page>
<#--    <div class="col-sm-4"></div>-->
    <div class="col-sm-4">
        <div align="center">Редактор пользователя</div>
        <form action="/user" method="post">
            <div class="form-group">
                <label for="username">Имя пользователя</label>
                <input type="text" class="form-control" id="username" name="username" value="${user.name}">
                <label for="password">Пароль</label>
                <input type="text" class="form-control" id="password" name="password" value="${user.password}">
            </div>
            <#list roles as role>
                <div>
                    <label><input type="checkbox"
                                  name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}</label>
                </div>
            </#list>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button class="btn btn-primary" type="submit">Сохранить</button>
        </form>

        <div>
            <a href="/user">Назад</a>
        </div>
    </div>
<#--    <div class="col-sm-4"></div>-->
</@c.page>