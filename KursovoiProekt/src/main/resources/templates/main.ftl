<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>

    <div class="form-row">

        <div class="col-sm-4">

            <form method="get" action="/" class="form-inline">
                <div>
                    <input type="text" class="form-control" name="film_name" value="${filmname?if_exists}"
                           placeholder="Название фильма">
                    <button class="btn btn-primary" type="submit">Найти</button>
                </div>
            </form>

            <br>
            <div>Список Жанров</div>

            <#list genres as genre>
                <div>
                    <a href="/${genre.id}">${genre.name}</a>
                </div>
            <#else >
                Список жанров пуст
            </#list>
        </div>

        <div class="col-sm">
            <#--            <br>-->
            <#--            <div>Список Фильмов</div>-->
            <#--            <table class="table">-->

            <#--                <thead>-->
            <#--                <tr>-->
            <#--                    <th>Название Фильма</th>-->
            <#--                    <th></th>-->
            <#--                </tr>-->
            <#--                </thead>-->

            <#--                <#list films as film>-->
            <#--                &lt;#&ndash;        <div>&ndash;&gt;-->
            <#--                &lt;#&ndash;            <a href="/film/${film.id}">${film.name}</a>&ndash;&gt;-->
            <#--                &lt;#&ndash;            <a href="/film/edit/${film.id}">Редактировать</a>&ndash;&gt;-->
            <#--                &lt;#&ndash;        </div>&ndash;&gt;-->
            <#--                    <tr>-->
            <#--                        <td><a href="/film/${film.id}">${film.name}</a></td>-->
            <#--                        <td><a href="/film/edit/${film.id}">Редактировать</a></td>-->
            <#--                    </tr>-->
            <#--                <#else >-->
            <#--                    Список фильмов пуст-->
            <#--                </#list>-->

            <#--
                  </table>-->
            <div class="card-columns">
                <#list films as film>
                    <div class="card my-3" style="width: 10rem;">
<#--                        <#if film.imagepath.isEmpty()>-->
                            <a href="/film/${film.id}"><img src="${film.imagepath}" class="card-img-top"></a>
<#--                        </#if>-->
                    </div>
                <#--                <div class="card-body">-->
                    <h5 class="card-title"><a href="/film/${film.id}">${film.name}</a></h5>
                <#--                </div>-->
                    <#if user.isAdmin()>
                        <div><a href="/film/edit/${film.id}" class="btn btn-primary">Редактировать</a></div>
                    </#if>
                <#else>
                    Список фильмов пуст
                </#list>
            </div>
        </div>
        <div class="col-sm">
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div align="right">
                    <button class="btn btn-primary" type="submit">Выйти</button>
                </div>
                <#--        <input class="nav-link" type="submit" value="Выйти"/>-->
                <#--                <input type="submit" value="Выйти"/>-->
            </form>
            <#if user.isAdmin()>
                <div class="title mt-2" align="center">Администрирование</div>
                <div align="center"><a class="nav-link mt-4" href="/user">Пользователи</a></div>
                <div align="center"><a class="nav-link mt-4" href="/film/edit/addFilm/form">Добавить фильм</a></div>
            </#if>

        </div>

    </div>

</@c.page>