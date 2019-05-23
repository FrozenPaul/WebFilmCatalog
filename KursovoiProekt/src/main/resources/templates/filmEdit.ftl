<#import "parts/common.ftl" as c>

<@c.page>
    <div class="col-sm-4"></div>
    <div class="col-sm">
        <div align="center">Редактор фильма</div>
        <form action="/film/edit" method="post">
            <div class="form-group">
                <label for="filmname">Название фильма</label>
                <input type="text" class="form-control" id="filmname" name="name" value="${film.name}">
            </div>
            <div class="form-group">
                <label for="producer">Режиссер</label>
                <input type="text" class="form-control" id="producer" name="producer" value="${film.producer}">
            </div>

            <div class="form-group">
                <label for="genre">Жанр</label>
                <input type="text" class="form-control" id="genre" name="genreName" value="${genre.name}">
            </div>
            <div class="form-group">
                <label for="duration">Продолжительность</label>
                <input type="text" class="form-control" id="duration" name="duration" value="${film.duration}">
            </div>
            <div class="form-group">
                <label for="release_year">Год выхода</label>
                <input type="text" class="form-control" id="release_year" name="release_year"
                       value="${film.release_year}">
            </div>
            <div class="form-group">
                <label for="country">Страна</label>
                <input type="text" class="form-control" id="country" name="country" value="${film.country}">
            </div>

            <div class="form-group">
                <label for="exampleFormControlTextarea1">Описание</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="7"
                          name="description">${film.description}</textarea>
            </div>

            <input type="hidden" value="${film.id}" name="filmId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <div>
                <button class="btn btn-primary" type="submit">Сохранить</button>
            </div>
        </form>

        <form action="/film/edit/delete" method="post">
            <input type="hidden" value="${film.id}" name="filmId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button class="btn btn-primary" type="submit">Удалить</button>
        </form>
        <form action="/" method="get">
            <button class="btn btn-primary" type="submit">Назад</button>
        </form>
    </div>
    <div class="col-sm-4"></div>
</@c.page>