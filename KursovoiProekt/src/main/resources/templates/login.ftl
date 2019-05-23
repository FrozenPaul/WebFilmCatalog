<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div class="col-sm-4" align="center">Регистрация</div>
    <@l.login "/login" "Войти" />
    <br>
    <div class="col-sm-4">
        <form action="/registration" method="get">
            <button class="btn btn-primary" type="submit">Добавить нового пользователя</button>
        </form>
    </div>
<#--    <a href="/registration">Добавить нового пользователя</a>-->

</@c.page>