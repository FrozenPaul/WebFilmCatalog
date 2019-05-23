<#import "parts/common.ftl" as c>

<@c.page>
<#--    <div>-->
<#--        <a href="/">На главную</a>-->
<#--    </div>-->
    <div>Список пользователей</div>
    <table class="table table-bordered ">
        <thead class="thead-dark">
        <tr>
            <th>Имя Пользователя</th>
            <th>Роль</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.name}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id}">Редактировать</a> </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>