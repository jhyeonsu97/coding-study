<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서검색</title>
</head>

<body>

	<script src="https://code.jquery.com/jquery-3.7.0.js"
        integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script>
    function searchBook() {
        var searchType = $("#searchType").val();
        var keyword = $("#bookSearch").val();
        if (!keyword) {
            alert("검색어를 입력하세요.");
            return;
        }
        $.ajax({
            method: "GET",
            url: "https://dapi.kakao.com/v3/search/book",
            data: { target: searchType, query: keyword },
            headers: { Authorization: "KakaoAK 17277a95dd97fdc1056945e7eb59c526" }
        })
            .done(function (msg) {
                if (msg.documents.length === 0) {
                    alert("검색 결과를 찾을 수 없습니다.");
                    return;
                }
                var bookInfo = "<img src='" + msg.documents[0].thumbnail + "'/><br>" +
                    "<strong>제목 : " + msg.documents[0].title + "</strong><br>" +
                    "<strong>저자 : " + msg.documents[0].authors + "</strong><br>" +
                    "<strong>출판사 : " + msg.documents[0].publisher + "</strong><br>" +
                    "<strong>ISBN : " + msg.documents[0].isbn + "</strong><br>" +
                    "<strong>줄거리 : " + msg.documents[0].contents + "...</strong><br>" +
                    "<strong>출판일 : " + msg.documents[0].datetime.split('T')[0] + "</strong>";

                $("p").html(bookInfo);

                // 검색한 도서 정보를 입력 폼에 자동으로 채워넣기
                $("#bookThumbnail").val(msg.documents[0].thumbnail);
                $("#bookTitle").val(msg.documents[0].title);
                $("#bookAuthors").val(msg.documents[0].authors);
                $("#bookPublisher").val(msg.documents[0].publisher);
                $("#bookISBN").val(msg.documents[0].isbn);
                $("#bookContents").val(msg.documents[0].contents);
                $("#bookDatetime").val(msg.documents[0].datetime.split('T')[0]);
            })
            .fail(function () {
                alert("검색 중 오류가 발생했습니다.");
            });
    }

    function insertBookInfo() {
        var thumbnail = $("#bookThumbnail").val();
        var title = $("#bookTitle").val();
        var authors = $("#bookAuthors").val();
        var publisher = $("#bookPublisher").val();
        var isbn = $("#bookISBN").val();
        var contents = $("#bookContents").val();
        var datetime = $("#bookDatetime").val();

        if (!thumbnail || !title || !authors || !publisher || !isbn  || !datetime) {
            alert("도서 정보를 모두 입력하세요.");
            return;
        }

        $.ajax({
            method: "POST",
            url: "/bookInputSave.do",
            data: {
                thumbnail: thumbnail,
                title: title,
                authors: authors,
                publisher: publisher,
                isbn: isbn,
                contents: contents,
                datetime: datetime
            },
            success: function (msg) {
                alert("도서 정보가 입력되었습니다.");
                $("#bookForm")[0].reset();
                $("p").empty();
            },
            error: function () {
                alert("도서 정보가 입력되지않았습니다.");
            }
        });
    }
    
    $(function() {
        $("#searchButton").on("click", function () {
            searchBook();
        });

    
        $("#bookSearch").on("keyup", function (event) {
            if (event.key === "Enter") {
                searchBook();
            }
        });

        $("#bookForm").submit(function (event) {
            event.preventDefault();
            insertBookInfo();
        });
    });
    </script>
    
    <h3>도서검색프로그램</h3>
    <label for="searchType">검색 유형:</label>
    <select id="searchType">
        <option value="title">제목</option>
        <option value="authors">저자</option>
        <option value="isbn">ISBN</option>
    </select>
    <label for="bookSearch">검색어:</label>
    <input type="text" id="bookSearch" placeholder="검색어를 입력하세요">
    <button id="searchButton">검색</button>

    <h3>도서 정보 입력</h3>
    <form id="bookForm">
        <label for="bookThumbnail">이미지 URL : </label>
        <input type="text" id="bookThumbnail" name="bookThumbnail" required>
        <br>
        <label for="bookTitle">제목 : </label>
        <input type="text" id="bookTitle" name="bookTitle" required>
        <br>
        <label for="bookAuthors">저자 : </label>
        <input type="text" id="bookAuthors" name="bookAuthors" required>
        <br>
        <label for="bookPublisher">출판사 : </label>
        <input type="text" id="bookPublisher" name="bookPublisher" required>
        <br>
        <label for="bookISBN">ISBN : </label>
        <input type="text" id="bookISBN" name="bookISBN" required>
        <br>
        <label for="bookContents">줄거리 : </label>
        <textarea id="bookContents" name="bookContents" rows="5" required></textarea>
        <br>
        <label for="bookDatetime">출판일 : </label>
        <input type="text" id="bookDatetime" name="bookDatetime" readonly>
        <br>
        <button type="submit" id="button1">도서 정보 입력</button>
    </form>

    <h3>도서 정보</h3>
    <p></p>

    
</body>

</html>
