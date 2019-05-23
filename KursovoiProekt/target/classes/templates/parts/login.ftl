<#macro login path button>
    <div class="col-sm-4">
        <form action="${path}" method="post">
            <div class="form-group">
                <label for="Логин">Логин</label>
                <input type="text" class="form-control" id="Логин" name="username">
            </div>
            <div class="form-group">
                <label for="Пароль">Пароль</label>
                <input type="password" class="form-control" id="Пароль" name="password">
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit" value="${button}">${button}</button>
        </form>
    </div>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
<#--        <button class="btn btn-primary" type="submit">Выйти</button>-->
<#--        <input class="nav-link" type="submit" value="Выйти"/>-->
        <input type="submit" value="Выйти"/>
    </form>
</#macro>