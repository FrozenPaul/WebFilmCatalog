<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div class="col-sm-4" align="center">Добавить нового пользователя</div>

    ${message?if_exists}
    <@l.login "/registration" "Добавить"/>
    <br>
<#--    <a href="/login">На страницу регистрации</a>-->
    <div class="col-sm-4">
        <form action="/login" method="get">
            <button class="btn btn-primary" type="submit">На страницу регистрации</button>
        </form>
    </div>
</@c.page>